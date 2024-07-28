//
//  PFeedFetchingUseCase.swift
//
//
//  Created by Anton on 28/07/2024.
//

import DLEntities
import Foundation

public protocol PFeedFetchingUseCase {
	func fetchPhotosFragment (perPage: Int) async throws -> PhotosFragmentEntity
	func fetchPhotosFragment (nextFragmentUrl: URL) async throws -> PhotosFragmentEntity
}
