//
//  FeedFetchingUseCase.swift
//
//
//  Created by Anton on 28/07/2024.
//

import Foundation
import Dependencies
import DLEntities
import DLRepositories
import DLUseCasesDataProvidersProtocols
import DLUseCasesProtocols

public struct FeedFetchingUseCase: PFeedFetchingUseCase {
	@Dependency(\.feedDataProvider) var feedDataProvider

	public func fetchPhotosFragment (perPage: Int = 10) async throws -> PhotosFragmentEntity {
		try await feedDataProvider.load(photosPerPage: perPage)
	}

	public func fetchPhotosFragment (nextFragmentUrl: URL) async throws -> PhotosFragmentEntity {
		try await feedDataProvider.load(nextFragmentUrl: nextFragmentUrl)
	}
}
