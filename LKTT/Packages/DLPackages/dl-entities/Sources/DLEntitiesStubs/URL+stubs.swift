//
//  URL+stubs.swift
//  
//
//  Created by Anton on 28/07/2024.
//

import Foundation

public extension URL {
	static let stubOriginal = Self(string: "test.com/original")!
	static let stubLarge = Self(string: "test.com/large")!

	static let stubPreviousFragment = Self(string: "test.com/previous")!
	static let stubNextFragment = Self(string: "test.com/next")!
}
