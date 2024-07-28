//
//  PFeedDataProvider.swift
//
//
//  Created by Anton on 28/07/2024.
//

import DLEntities
import Foundation

public protocol PFeedDataProvider {
	func load (photosPerPage: Int) async throws -> PhotosFragmentEntity
	func load (nextFragmentUrl: URL) async throws -> PhotosFragmentEntity
}
