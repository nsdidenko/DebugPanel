// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DebugPanel",
    platforms: [ .iOS(.v15) ],
    products: [
        .library(name: "DebugPanel", targets: ["DebugPanel"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "DebugPanel", dependencies: [], path: "Sources")
    ]
)
