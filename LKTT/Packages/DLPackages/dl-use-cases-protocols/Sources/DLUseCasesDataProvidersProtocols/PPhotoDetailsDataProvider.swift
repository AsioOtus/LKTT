//
//  PFeedDataProvider.swift
//  
//
//  Created by Anton on 31/07/2024.
//

import Foundation

public protocol PPhotoDetailsDataProvider {
	func loadPhoto (url: URL) async throws -> Data
}

