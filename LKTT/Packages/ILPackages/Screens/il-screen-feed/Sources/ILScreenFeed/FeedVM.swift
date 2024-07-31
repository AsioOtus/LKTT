//
//  FeedVM.swift
//
//
//  Created by Anton on 28/07/2024.
//

import Combine
import DLEntities
import Multitool
import SwiftUI
import UIKit

final class FeedVM: NSObject {
	private var subscriptions = Set<AnyCancellable>()

	let interactor: PFeedInteractor
	var dataSource: FeedDataSource?
	var coordinator: FeedCoordinator?

	var currentFragmentRequestState: CurrentValueSubject<Loadable<PhotosFragmentEntity>, Never> {
		interactor.currentFragment
	}

	init (interactor: PFeedInteractor) {
		self.interactor = interactor

		super.init()

		configureSubscriptions()
	}
}

extension FeedVM {
	func onViewDidLoad () {
		loadNextFragment()
	}

	func onRefreshButtonTap () {
		reloadCurrentFragment()
	}

	func onRefresh () {
		reload()
	}

	func onCellTap (_ indexPath: IndexPath) {
		guard let selectedPhoto = dataSource?.snapshot().itemIdentifiers[indexPath.row] else { return }
		coordinator?.navigate(selectedPhoto.originalUrl)
	}
}

extension FeedVM: UICollectionViewDataSourcePrefetching {
	func collectionView (_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
		guard let itemsCount = dataSource?.snapshot().numberOfItems else { return }
		guard let indexPath = indexPaths.last else { return }
		guard itemsCount - indexPath.row < interactor.photosPerPage else { return }

		loadNextFragment()
	}
}

private extension FeedVM {
	func configureSubscriptions () {
		interactor.currentFragment
			.sink { [weak self] in
				guard let self else { return }
				guard var snapshot = dataSource?.snapshot() else { return }

				defer {
					Task { @MainActor [snapshot] in
						self.dataSource?.apply(snapshot, animatingDifferences: true)
					}
				}

				snapshot.reloadSections([0])

				guard let photos = $0.successfulValue?
					.photos
					.map({
						PhotoModel(
							id: $0.id,
							photographerName: $0.photographerName + $0.id.description,
							largeUrl: $0.largeUrl,
							originalUrl: $0.originalUrl
						)
					})
				else { return }

				snapshot.appendItems(photos)
			}
			.store(in: &subscriptions)
	}
}

private extension FeedVM {
	func loadNextFragment () {
		Task {
			await interactor.loadNextFragment()
		}
	}

	func reloadCurrentFragment () {
		Task {
			await interactor.reloadLastFragment()
		}
	}

	func reload () {
		Task { @MainActor in
			guard var snapshot = dataSource?.snapshot() else { return }
			snapshot.deleteAllItems()
			dataSource?.apply(snapshot, animatingDifferences: true)
		}

		Task {
			await interactor.reload()
		}
	}
}
