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
		fatalError()
	}

	func load (nextFragmentUrl: URL) async throws -> PhotosFragmentEntity {
		fatalError()
	}
}
