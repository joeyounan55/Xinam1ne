// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(macOS)
let package = Package(
    name: "installHaxx",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .executable(
            name: "installHaxx",
            targets: ["installHaxx"]),
    ],
    dependencies: [
        .package(name: "SwiftUtils", url: "https://github.com/pinauten/SwiftUtils", .branch("master")),
        .package(name: "SwiftMachO", url: "https://github.com/pinauten/SwiftMachO", .branch("master"))
    ],
    targets: [
        .executableTarget(
            name: "installHaxx",
            dependencies: ["SwiftUtils", "SwiftMachO"]),
    ]
)
#else
let package = Package(
    name: "installHaxx",
    products: [
        .executable(
            name: "installHaxx",
            targets: ["installHaxx"]),
    ],
    targets: [
        .executableTarget(
            name: "installHaxx",
            dependencies: []),
    ]
)
#endif
