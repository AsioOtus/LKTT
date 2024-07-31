// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "il-screen-photo-details",
	platforms: [
		.iOS(.v15),
	],
	products: [
		.library(
			name: "ILScreenPhotoDetails",
			targets: [
				"ILScreenPhotoDetails"
			]
		)
	],
	dependencies: [
		.package(url: "https://github.com/AsioOtus/multitool", from: "1.0.0"),
		.package(url: "https://github.com/pointfreeco/swift-dependencies", exact: "1.3.0"),
	],
	targets: [
		.target(
			name: "ILScreenPhotoDetails",
			dependencies: [
				.product(name: "Multitool", package: "multitool"),
				.product(name: "Dependencies", package: "swift-dependencies"),
			]
		)
	]
)
