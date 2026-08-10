// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-witness-observation",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "Witness Observation",
            targets: ["WitnessObservation"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-foundations/swift-witnesses.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "WitnessObservation",
            dependencies: [
                .product(name: "Witnesses", package: "swift-witnesses"),
            ]
        ),
        .testTarget(
            name: "Witness Observation Tests",
            dependencies: ["WitnessObservation"]
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
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem
}
