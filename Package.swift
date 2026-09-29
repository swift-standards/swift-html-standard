// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-html-standard",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "HTML Standard",
            targets: ["HTML Standard"]
        ),
        .library(name: "HTML Standard Attributes", targets: ["HTML Standard Attributes"]),
        .library(name: "HTML Standard Elements", targets: ["HTML Standard Elements"]),
        .library(name: "HTML Standard Test Support", targets: ["HTML Standard Test Support"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-whatwg/swift-whatwg-html.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-geometry.git",
            branch: "main", traits: ["Affine"]
        ),
    ],
    targets: [
        .target(
            name: "HTML Standard",
            dependencies: [
                .product(name: "WHATWG HTML", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML Forms", package: "swift-whatwg-html"),
                .product(name: "Geometry", package: "swift-geometry"),
            ]
        ),
        .target(
            name: "HTML Standard Attributes",
            dependencies: [
                .product(name: "WHATWG HTML Shared", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML GlobalAttributes", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML FormAttributes", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML LinkAttributes", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML MediaAttributes", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML TableAttributes", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML ScriptAttributes", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML Metadata", package: "swift-whatwg-html"),
            ]
        ),
        .target(
            name: "HTML Standard Elements",
            dependencies: [
                .product(name: "WHATWG HTML Shared", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML Elements", package: "swift-whatwg-html"),
            ]
        ),
        .target(
            name: "HTML Standard Test Support",
            dependencies: [
                .target(name: "HTML Standard"),
                .product(
                    name: "Geometry Test Support",
                    package: "swift-geometry"
                ),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "HTML Standard Tests",
            dependencies: [
                .target(name: "HTML Standard"),
                .target(name: "HTML Standard Test Support"),
            ],
            path: "Tests/HTML Standard Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
