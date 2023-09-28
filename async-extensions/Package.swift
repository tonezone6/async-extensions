// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AsyncExtensions",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AsyncExtensions",
            targets: ["AsyncExtensions"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AsyncExtensions",
            dependencies: []),
        .testTarget(
            name: "AsyncExtensionsTests",
            dependencies: ["AsyncExtensions"])
    ]
)
