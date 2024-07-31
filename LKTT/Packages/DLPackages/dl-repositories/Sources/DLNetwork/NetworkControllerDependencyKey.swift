//
//  NetworkControllerDependencyKey.swift
//
//
//  Created by Anton on 28/07/2024.
//

import Dependencies
import DLLogic
import Foundation
import NetworkUtil

public enum NetworkControllerDependencyKey: DependencyKey {
	public static var liveValue: any FullScaleNetworkController {
		StandardNetworkController(
			configuration: .init(
				address: "",
				headers: [
					"Authorization": Bundle.main.pexelsToken
				]
			)
		)
	}
}

public extension DependencyValues {
	var networkController: any FullScaleNetworkController {
		get { self[NetworkControllerDependencyKey.self] }
		set { self[NetworkControllerDependencyKey.self] = newValue }
	}
}
