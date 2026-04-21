// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "testing",
    platforms: [
        .macOS(.v26),
    ],
    dependencies: [
        .package(path: ".."),
        .package(path: "../../../swift-foundations/swift-testing"),
    ],
    targets: [
        .testTarget(
            name: "HTML Standard Performance Tests",
            dependencies: [
                .product(name: "HTML Standard", package: "swift-html-standard"),
                .product(name: "Testing", package: "swift-testing"),
            ],
            path: "HTML Standard Performance Tests"
        ),
        .testTarget(
            name: "HTML Standard Snapshot Tests",
            dependencies: [
                .product(name: "HTML Standard", package: "swift-html-standard"),
                .product(name: "Testing", package: "swift-testing"),
            ],
            path: "HTML Standard Snapshot Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem
}
