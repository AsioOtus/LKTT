//
//  Bundle+info.swift
//
//
//  Created by Anton on 31/07/2024.
//

import Foundation

public extension Bundle {
	var pexelsToken: String {
		guard let token = object(forInfoDictionaryKey: "PexelsToken") as? String
		else { fatalError() }

		return token
	}
}
