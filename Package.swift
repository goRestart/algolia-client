// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "AlgoliaSearch",
  products: [
    .library(
      name: "AlgoliaSearch",
      targets: ["AlgoliaSearch"]),
    ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.4.0"))
  ],
  targets: [
    .target(
      name: "AlgoliaSearch",
      dependencies: ["Vapor"]),
    .testTarget(
      name: "AlgoliaSearchTests",
      dependencies: ["AlgoliaSearch"]),
    ]
)
