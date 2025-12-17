// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-html-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "HTML Standard",
            targets: ["HTML Standard"]
        ),
        .library(name: "HTML Standard Attributes", targets: ["HTML Standard Attributes"]),
        .library(name: "HTML Standard Elements", targets: ["HTML Standard Elements"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-whatwg-html", from: "0.2.2"),
        .package(url: "https://github.com/swift-standards/swift-standards", from: "0.16.1"),
    ],
    targets: [
        .target(
            name: "HTML Standard",
            dependencies: [
                .product(name: "WHATWG HTML", package: "swift-whatwg-html"),
                .product(name: "Geometry", package: "swift-standards")
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
                .product(name: "WHATWG HTML Metadata", package: "swift-whatwg-html")
            ]
        ),
        .target(
            name: "HTML Standard Elements",
            dependencies: [
                .product(name: "WHATWG HTML Shared", package: "swift-whatwg-html"),
                .product(name: "WHATWG HTML Elements", package: "swift-whatwg-html")
            ]
        ),
        .testTarget(
            name: "HTML Standard".tests,
            dependencies: ["HTML Standard"]
        )
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { self + " Tests" }
    var foundation: Self { self + " Foundation" }
}

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    let existing = target.swiftSettings ?? []
    target.swiftSettings = existing + [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility")
    ]
}
