// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension String {
    static let htmlCSS: Self = "CSSPointFreeHTML"
    static let htmlCSSPointFree: Self = "HTMLCSSPointFreeHTML"
    static let htmlAttributesPointFreeHTML: Self = "HTMLAttributesPointFreeHTML"
    static let htmlElementsPointFreeHTML: Self = "HTMLElementsPointFreeHTML"
}

extension Target.Dependency {
    static var htmlCSS: Self { .target(name: .htmlCSS) }
    static var htmlAttributesPointFreeHTML: Self { .target(name: .htmlAttributesPointFreeHTML) }
    static var htmlElementsPointFreeHTML: Self { .target(name: .htmlElementsPointFreeHTML) }
    static var htmlCSSPointFree: Self { .target(name: .htmlCSSPointFree) }
}

extension Target.Dependency {
    static var cssPropertyTypes: Self { .product(name: "CSSPropertyTypes", package: "swift-css-types") }
    static var cssAtRuleTypes: Self { .product(name: "CSSAtRuleTypes", package: "swift-css-types") }
    static var cssTypes: Self { .product(name: "CSSTypes", package: "swift-css-types") }
    static var htmlStandardAttributes: Self { .product(name: "HTML Standard Attributes", package: "swift-html-standard") }
    static var htmlStandardElements: Self { .product(name: "HTML Standard Elements", package: "swift-html-standard") }
    static var htmlStandard: Self { .product(name: "HTML Standard", package: "swift-html-standard") }
    static var pointFreeHTML: Self { .product(name: "PointFreeHTML", package: "pointfree-html") }
    static var pointFreeHtmlTestSupport: Self { .product(name: "PointFreeHTMLTestSupport", package: "pointfree-html") }
}

let package = Package(
    name: "swift-html-css-pointfree",
    platforms: [
        .iOS(.v18),
        .macOS(.v15),
        .tvOS(.v18),
        .watchOS(.v11),
        .macCatalyst(.v18),
    ],
    products: [
        .library(name: .htmlCSS, targets: [.htmlCSS]),
        .library(name: .htmlCSSPointFree, targets: [.htmlCSSPointFree]),
        .library(name: .htmlAttributesPointFreeHTML, targets: [.htmlAttributesPointFreeHTML]),
        .library(name: .htmlElementsPointFreeHTML, targets: [.htmlElementsPointFreeHTML]),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-html-standard.git", from: "0.1.0"),
        .package(url: "https://github.com/coenttb/swift-css-types.git", from: "0.0.1"),
        .package(url: "https://github.com/coenttb/pointfree-html.git", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: .htmlCSSPointFree,
            dependencies: [
                .htmlCSS,
                .pointFreeHTML,
                .cssTypes,
                .htmlStandard,
                .htmlElementsPointFreeHTML,
                .htmlAttributesPointFreeHTML,
            ]
        ),
        .testTarget(
            name: .htmlCSSPointFree.tests,
            dependencies: [
                .htmlCSSPointFree,
                .pointFreeHTML,
                .pointFreeHtmlTestSupport,
            ]
        ),
        .target(
            name: .htmlCSS,
            dependencies: [
                .cssTypes,
                .pointFreeHTML,
            ]
        ),
        .testTarget(
            name: .htmlCSS.tests,
            dependencies: [
                .htmlCSS,
                .cssTypes,
                .pointFreeHTML,
                .pointFreeHtmlTestSupport,
            ]
        ),
        .target(
            name: .htmlAttributesPointFreeHTML,
            dependencies: [
                .htmlStandardAttributes,
                .pointFreeHTML
            ]
        ),
        .testTarget(
            name: .htmlAttributesPointFreeHTML.tests,
            dependencies: [
                .htmlAttributesPointFreeHTML,
                .pointFreeHTML,
                .pointFreeHtmlTestSupport,
            ]
        ),
        .target(
            name: .htmlElementsPointFreeHTML,
            dependencies: [
                .htmlStandardElements,
                .htmlAttributesPointFreeHTML,
                .pointFreeHTML,
            ]
        ),
        .testTarget(
            name: .htmlElementsPointFreeHTML.tests,
            dependencies: [
                .htmlElementsPointFreeHTML,
                .pointFreeHTML,
                .pointFreeHtmlTestSupport
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
