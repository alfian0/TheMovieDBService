// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TheMovieDBService",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TheMovieDBService",
            targets: ["TheMovieDBService"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
      .package(url: "https://github.com/alfian0/TheMovieDBCore.git", branch: "main"),
      .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TheMovieDBService",
            dependencies: [
              "TheMovieDBCore",
              "Alamofire"
            ],
            resources: [
              .process("Resources/MovieContainer.xcdatamodeld"),
              .process("Resources/Localizable.strings"),
              .process("Resources/movie_detail.json"),
              .process("Resources/now_playing.json")
            ]
        ),
        .testTarget(
            name: "TheMovieDBServiceTests",
            dependencies: ["TheMovieDBService"]),
    ]
)
