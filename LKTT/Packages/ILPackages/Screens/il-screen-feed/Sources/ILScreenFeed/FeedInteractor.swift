//
//  FeedInteractor.swift
//
//
//  Created by Anton on 28/07/2024.
//

import Combine
import Dependencies
import DLEntities
import DLUseCases
import DLUseCasesProtocols
import Foundation
import Multitool

protocol PFeedInteractor {
	var photosPerPage: Int { get }

	var currentFragment: CurrentValueSubject<Loadable<PhotosFragmentEntity>, Never> { get }

	func loadNextFragment () async
	func reloadLastFragment () async
	func reload () async 
}

actor FeedInteractor: PFeedInteractor {
	@Dependency(\.feedFetchingUseCase) var feedFetchingUseCase

	let photosPerPage = 20

	var lastLoadedFragment: PhotosFragmentEntity?
	let currentFragment: CurrentValueSubject<Loadable<PhotosFragmentEntity>, Never> = .init(.initial)
}

extension FeedInteractor {
	func loadNextFragment () async {
			switch currentFragment.value {
			case .initial:
				loadFirstFragment()

			case .loading:
				return

			case .successful(let lastFragment):
				loadNextFragment(lastFragment: lastFragment)

			case .failed:
				return
			}
	}

	func reloadLastFragment () async {
		if let lastLoadedFragment {
			loadNextFragment(lastFragment: lastLoadedFragment)
		} else {
			loadFirstFragment()
		}
	}

	func reload () async {
		lastLoadedFragment = nil
		currentFragment.value.cancel()
		loadFirstFragment()
	}
}

private extension FeedInteractor {
	func loadFirstFragment () {
		loadPhotoFragment {
			try await self.feedFetchingUseCase.fetchPhotosFragment(perPage: self.photosPerPage)
		}
	}

	func loadNextFragment (lastFragment: PhotosFragmentEntity) {
		guard let nextFragmentUrl = lastFragment.nextFragmentUrl else { return }

		loadPhotoFragment {
			try await self.feedFetchingUseCase.fetchPhotosFragment(nextFragmentUrl: nextFragmentUrl)
		}
	}

	func loadPhotoFragment (_ loadingAction: @escaping () async throws -> PhotosFragmentEntity) {
		let loadingTask = Task<Void, Error> {
			let result = await Loadable<PhotosFragmentEntity>.result {
				let photoFragment = try await loadingAction()
				lastLoadedFragment = photoFragment
				return photoFragment
			}

			self.currentFragment.send(result)
		}

		self.currentFragment.value.cancel()
		self.currentFragment.send(.loading(task: loadingTask))
	}
}
