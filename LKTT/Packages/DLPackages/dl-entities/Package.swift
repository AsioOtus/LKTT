// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "dl-entities",
	platforms: [
		.iOS(.v15),
	],
	products: [
		.library(
			name: "DLEntities",
			targets: [
				"DLEntities",
			]
		),
	],
	targets: [
		.target(
			name: "DLEntities"
		),
	]
)
