// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(macOS)
let package = Package(
    name: "Exe2Driver",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .executable(
            name: "Exe2Driver",
            targets: ["Exe2Driver"]),
    ],
    dependencies: [
        .package(name: "SwiftUtils", url: "https://github.com/pinauten/SwiftUtils", .branch("master")),
        .package(name: "SwiftMachO", url: "https://github.com/pinauten/SwiftMachO", .branch("master"))
    ],
    targets: [
        .target(
            name: "Exe2Driver",
            dependencies: ["SwiftUtils", "SwiftMachO"])
    ]
)
#else
let package = Package(
    name: "Exe2Driver",
    products: [
        .executable(
            name: "Exe2Driver",
            targets: ["Exe2Driver"]),
    ],
    targets: [
        .target(
            name: "Exe2Driver",
            dependencies: [])
    ]
)
#endif
