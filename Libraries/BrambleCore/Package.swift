// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BrambleCore",
    platforms: [
        .macOS(.v15),
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "BrambleCore",
            targets: ["BrambleCore"]),
    ],
    targets: [
        .target(
            name: "BrambleCore"),
        .testTarget(
            name: "BrambleCoreTests",
            dependencies: ["BrambleCore"]
        ),
    ]
)
