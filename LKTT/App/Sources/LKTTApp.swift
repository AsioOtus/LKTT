//
//  LKTTApp.swift
//  App
//
//  Created by Anton on 28/07/2024.
//

import Dependencies
import DLNetwork
import Kingfisher
import ILScreenRoot
import SwiftUI

@main
struct LKTTApp: App {
	@Dependency(\.networkController) var networkController

	init () {
		Task { [self] in
			for await log in networkController.logs {
				if let url = log.message.urlRequest?.url {
					print(url)
				}
			}
		}

		ImageCache.default.memoryStorage.config.totalCostLimit = 2000
		ImageCache.default.memoryStorage.config.expiration = .days(3)
		ImageCache.default.diskStorage.config.sizeLimit = 1_000_000_000
	}

	var body: some Scene {
		WindowGroup {
			RootView()
		}
	}
}
