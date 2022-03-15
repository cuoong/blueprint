// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppCore",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppCore",
            targets: ["AppCore"]),
        .library(
            name: "AppDelegate",
            targets: ["AppDelegate"]),
        .library(
            name: "Models",
            targets: ["Models"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),`
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.33.1"),
        .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "0.2.1"),
        .package(url: "https://github.com/sparkle-project/Sparkle", from: "2.0.0")
    ],
    targets: [
        // MARK: Application Targets
        .target(
            name: "AppCore",
            dependencies: [
                "Models",
                "AppDelegate",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        
        .target(name: "AppDelegate", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        ]),
        .target(name: "Models", dependencies: []),
        
        // MARK: Testing Targets
        .testTarget(
            name: "AppCoreTests",
            dependencies: ["AppCore"]),
    ]
)
