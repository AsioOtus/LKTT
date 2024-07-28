//
//  PhotosFragmentEntity+stubs.swift
//  
//
//  Created by Anton on 28/07/2024.
//

import DLEntities

public extension PhotosFragmentEntity {
	static let stubFirstPage = Self(
		page: 1,
		photosPerPage: 5,
		photos: .init(PhotoEntity.stubAll[0..<5]),
		previousFragmentUrl: .stubPreviousFragment,
		nextFragmentUrl: .stubNextFragment
	)

	static let stubSecondPage = Self(
		page: 2,
		photosPerPage: 5,
		photos: .init(PhotoEntity.stubAll[5...]),
		previousFragmentUrl: .stubPreviousFragment,
		nextFragmentUrl: .stubNextFragment
	)
}

