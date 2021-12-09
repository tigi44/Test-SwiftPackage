// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPackage",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftPackage",
            targets: ["SwiftPackage", "BlueViewFramework"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftPackage",
            dependencies: [],
            resources: [.process("Resource/Schedule.png"),
                        .process("Resource/Contents.json")]),
        
        .binaryTarget(
            name: "BlueViewFramework",
            path: "Sources/BlueViewFramework.xcframework"
        ),
        
        .testTarget(
            name: "SwiftPackageTests",
            dependencies: ["SwiftPackage"]),
    ]
)
