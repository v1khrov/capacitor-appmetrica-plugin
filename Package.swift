// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorAppmetricaPlugin",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CapacitorAppmetricaPlugin",
            targets: ["AppMetricaPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "8.0.0"),
        // Диапазон совпадает с podspec. Используемый API стабилен в 5.14 - 7.x
        .package(url: "https://github.com/appmetrica/appmetrica-sdk-ios.git", "5.14.0"..<"8.0.0")
    ],
    targets: [
        .target(
            name: "AppMetricaPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                // Тот же набор модулей, что и в pod 'AppMetricaAnalytics'
                .product(name: "AppMetricaCore", package: "appmetrica-sdk-ios"),
                .product(name: "AppMetricaCrashes", package: "appmetrica-sdk-ios"),
                .product(name: "AppMetricaAdSupport", package: "appmetrica-sdk-ios"),
                .product(name: "AppMetricaWebKit", package: "appmetrica-sdk-ios"),
                .product(name: "AppMetricaScreenshot", package: "appmetrica-sdk-ios")
            ],
            path: "ios/Sources/AppMetricaPlugin"),
        .testTarget(
            name: "AppMetricaPluginTests",
            dependencies: ["AppMetricaPlugin"],
            path: "ios/Tests/AppMetricaPluginTests")
    ]
)
