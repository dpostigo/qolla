// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Qolla",
    products: [
        .library(
            name: "Qolla",
            targets: ["Qolla"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Qolla",
            path: "Qolla"
        )
    ]
)
