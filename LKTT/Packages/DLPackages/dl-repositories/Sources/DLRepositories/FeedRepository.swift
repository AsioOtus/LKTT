//
//  FeedRepository.swift
//  
//
//  Created by Anton on 28/07/2024.
//

import Dependencies
import DLEntities
import DLNetwork
import DLUseCasesDataProvidersProtocols
import Foundation

struct FeedRepository: PFeedDataProvider {
	@Dependency(\.networkController) var networkController

	func load (photosPerPage: Int) async throws -> PhotosFragmentEntity {
		let request = CuratedRequest(page: 1, perPage: photosPerPage)
		let responseModel = try await networkController.send(request, responseModel: CuratedRequest.ResponseModel.self).model
		let photosFragmentEntity = map(responseModel)

		return photosFragmentEntity
	}

	func load (nextFragmentUrl: URL) async throws -> PhotosFragmentEntity {
		let request = NextCuratedRequest(addressUrl: nextFragmentUrl)
		let responseModel = try await networkController.send(request, responseModel: CuratedRequest.ResponseModel.self).model
		let photosFragmentEntity = map(responseModel)

		return photosFragmentEntity
	}
}

private extension FeedRepository {
	func map (_ responseModel: CuratedRequest.ResponseModel) -> PhotosFragmentEntity {
		.init(
			page: responseModel.page,
			photosPerPage: responseModel.perPage,
			photos: responseModel.photos.map {
				.init(
					id: $0.id,
					photographerName: $0.photographer,
					originalUrl: $0.src.original,
					largeUrl: $0.src.large
				)
			},
			previousFragmentUrl: responseModel.prevPage,
			nextFragmentUrl: responseModel.nextPage
		)
	}
}
