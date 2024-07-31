//
//  RepeatableNetworkControllerDependencyKey.swift
//
//
//  Created by Anton on 31/07/2024.
//

import Dependencies
import NetworkUtil

public enum RepeatableNetworkControllerDependencyKey: DependencyKey {
	public static var liveValue: any FullScaleNetworkController {
		@Dependency(\.networkController) var networkController

		return networkController
			.repeatable(
				maxAttempts: 10,
				delayStrategy: DelayProgressions.exponent()
			)
	}
}

public extension DependencyValues {
	var repeatableNetworkController: any FullScaleNetworkController {
		get { self[RepeatableNetworkControllerDependencyKey.self] }
		set { self[RepeatableNetworkControllerDependencyKey.self] = newValue }
	}
}
