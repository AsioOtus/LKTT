// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "dl-repositories",
	platforms: [
		.iOS(.v15),
		.macOS(.v13),
	],
	products: [
		.library(
			name: "DLRepositories",
			targets: [
				"DLRepositories"
			]
		)
	],
	dependencies: [
		.package(path: "../dl-entities"),
		.package(path: "../dl-use-cases"),

		.package(url: "https://github.com/AsioOtus/network-util", from: "1.0.0"),
		.package(url: "https://github.com/pointfreeco/swift-dependencies", exact: "1.3.0"),
	],
	targets: [
		.target(
			name: "DLRepositories",
			dependencies: [
				.target(name: "DLNetwork"),

				.product(name: "DLEntities", package: "dl-entities"),
				.product(name: "DLUseCasesProtocols", package: "dl-use-cases"),

				.product(name: "NetworkUtil", package: "network-util"),
				.product(name: "Dependencies", package: "swift-dependencies"),
			]
		),
		.target(
			name: "DLNetwork",
			dependencies: [
				.product(name: "NetworkUtil", package: "network-util"),
				.product(name: "Dependencies", package: "swift-dependencies"),
			]
		),
		.target(
			name: "DLNetworkStubs",
			dependencies: [
				.target(name: "DLNetwork"),

				.product(name: "DLEntitiesStubs", package: "dl-entities"),

				.product(name: "NetworkUtil", package: "network-util"),
				.product(name: "Dependencies", package: "swift-dependencies"),
			]
		),

		.testTarget(
			name: "DLRepositoriesTests",
			dependencies: [
				.target(name: "DLNetwork"),
				.target(name: "DLNetworkStubs"),
				.target(name: "DLRepositories"),

				.product(name: "DLEntities", package: "dl-entities"),
				.product(name: "DLEntitiesStubs", package: "dl-entities"),

				.product(name: "NetworkUtil", package: "network-util"),
				.product(name: "Dependencies", package: "swift-dependencies"),
			]
		),
	]
)