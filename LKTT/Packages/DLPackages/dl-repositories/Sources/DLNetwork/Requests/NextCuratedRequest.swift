//
//  NextCuratedRequest.swift
//
//
//  Created by Anton on 28/07/2024.
//

import Foundation
import NetworkUtil

public struct NextCuratedRequest: Request {
	public let addressUrl: URL

	public var path: String { "" }
	public var body: Data? { nil }

	public init (addressUrl: URL) {
		self.addressUrl = addressUrl
	}

	public func configurationUpdate (_ configuration: URLRequestConfiguration) -> URLRequestConfiguration {
		configuration.setAddress(addressUrl.absoluteString)
	}
}
