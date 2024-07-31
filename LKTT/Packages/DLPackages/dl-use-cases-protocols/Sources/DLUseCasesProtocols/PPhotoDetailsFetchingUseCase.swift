//
//  PPhotoDetailsFetchingUseCase.swift
//
//
//  Created by Anton on 31/07/2024.
//

import DLEntities
import Foundation

public protocol PPhotoDetailsFetchingUseCase {
	func loadPhoto (url: URL) async throws -> Data
}
