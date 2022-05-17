// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "MapstedNotifications",
    platforms: [
        .iOS(.v13)
    ],
    
    products: [
        .library(
            name: "MapstedAlerts",
            targets: ["MapstedAlertsWrapper"]
        ),
        .library(
            name: "LocationMarketing",
            targets: ["LocationMarketingWrapper"]
        ),
        .library(
            name: "MapstedTriggersCore",
            targets: ["MapstedTriggersCore"]
        )

    ],
    
    dependencies: [
            .package(
                name: "MapstedCore",
                url: "https://github.com/Mapsted/mapsted-sdk-core-spm",
                .upToNextMajor(from: "4.6.2")
            )
    ],
    
    targets: [
        
        /**
            Alerts
         */
        .target(name: "MapstedAlertsWrapper",
                dependencies: [
                    .target(name: "MapstedAlerts"),
                    .target(name: "MapstedTriggersCore"),
                    .product(name: "MapstedCore", package: "MapstedCore")
                ]
        ),
        .binaryTarget(
            name: "MapstedAlerts",
            path: "MapstedAlerts.xcframework"
        ),
        
        /**
            Location Marketing
         */
        .target(name: "LocationMarketingWrapper",
                dependencies: [
                    .target(name: "LocationMarketing"),
                    .target(name: "MapstedTriggersCore"),
                    .product(name: "MapstedCore", package: "MapstedCore")
                ]
        ),
        .binaryTarget(
            name: "LocationMarketing",
            path: "LocationMarketing.xcframework"
        ),
        
        /**
            Triggers Core
         */
        .binaryTarget(
            name: "MapstedTriggersCore",
            path: "MapstedTriggersCore.xcframework"
        )
    ])


