// swift-tools-version:5.5

/**
*  Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "Publish",
    platforms: [.macOS(.v12)],
    products: [
        .library(name: "Publish", targets: ["Publish"]),
        .executable(name: "publish-cli", targets: ["PublishCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/ink.git", from: "0.2.0"),
        .package(url: "https://github.com/johnsundell/plot.git", from: "0.9.0"),
        .package(url: "https://github.com/johnsundell/files.git", from: "4.0.0"),
        .package(url: "https://github.com/johnsundell/codextended.git", from: "0.1.0"),
        .package(url: "https://github.com/johnsundell/shellout.git", from: "2.3.0"),
        .package(url: "https://github.com/johnsundell/sweep.git", from: "0.4.0"),
        .package(url: "https://github.com/johnsundell/collectionConcurrencyKit.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Publish",
            dependencies: [
                .product(name: "Ink", package: "ink"),
                .product(name: "Plot", package: "plot"),
                .product(name: "Files", package: "files"),
                .product(name: "Codextended", package: "codextended"),
                .product(name: "ShellOut", package: "shellout"),
                .product(name: "Sweep", package: "sweep"),
                .product(name: "CollectionConcurrencyKit", package: "collectionConcurrencyKit")
            ]
        ),
        .executableTarget(
            name: "PublishCLI",
            dependencies: ["PublishCLICore"]
        ),
        .target(
            name: "PublishCLICore",
            dependencies: ["Publish"]
        ),
        .testTarget(
            name: "PublishTests",
            dependencies: ["Publish", "PublishCLICore"]
        )
    ]
)
