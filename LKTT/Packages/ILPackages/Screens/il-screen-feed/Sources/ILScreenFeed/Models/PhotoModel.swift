//
//  PhototModel.swift
//
//
//  Created by Anton on 29/07/2024.
//

import Foundation

struct PhotoModel: Hashable {
	public let id: Int
	public let photographerName: String
	public let largeUrl: URL
	public let originalUrl: URL

	public init (
		id: Int,
		photographerName: String,
		largeUrl: URL,
		originalUrl: URL
	) {
		self.id = id
		self.photographerName = photographerName
		self.largeUrl = largeUrl
		self.originalUrl = originalUrl
	}

	func hash (into hasher: inout Hasher) {
		hasher.combine(id)
	}
}
