//
//  NetworkControllerDependencyKey.swift
//
//
//  Created by Anton on 28/07/2024.
//

import Dependencies
import NetworkUtil

public enum NetworkControllerDependencyKey: DependencyKey {
	public static var liveValue: any NetworkController {
		StandardNetworkController(
			configuration: .init(
				scheme: "https",
				address: "api.pexels.com",
				baseSubpath: "v1/curated"
			)
		)
	}
}

public extension DependencyValues {
	var networkController: any NetworkController {
		get { self[NetworkControllerDependencyKey.self] }
		set { self[NetworkControllerDependencyKey.self] = newValue }
	}
}
