// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PayPalKit",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(name: "PayPalKit", targets: ["PayPalKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/async-http-client.git", from: "1.20.0")
    ],
    targets: [
        .target(name: "PayPalKit", dependencies: [
            .product(name: "AsyncHTTPClient", package: "async-http-client"),
        ]),
        .testTarget(
            name: "PayPalKitTests",
            dependencies: ["PayPalKit", .product(name: "AsyncHTTPClient", package: "async-http-client"),]
        ),
    ]
)
