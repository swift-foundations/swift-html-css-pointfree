////
////  AnimationDelay Tests.swift
////  swift-html
////
////  Created by Claude AI on 11/04/2025.
////
//
// import Testing
// import CSSPointFreeHTML
// import PointFreeHTML
// import CSS_Standard
// import CSS_Standard
// import Dependencies
// import DependenciesTestSupport
// import InlineSnapshotTesting
// import PointFreeHTMLTestSupport
//
// @Suite(
//    "AnimationDelay Tests",
// )
// struct AnimationDelayTests {
//    @Test("HTML element renders with animation-delay time value properly")
//    func htmlElementWithAnimationDelayTimeRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.time("2s"))
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-delay-atnwFz{animation-delay:2s}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-atnwFz">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML element renders with animation-delay milliseconds value")
//    func htmlElementWithAnimationDelayMillisecondsRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.time("500ms"))
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-delay-DqVdD4{animation-delay:500ms}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-DqVdD4">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML element renders with animation-delay multiple times")
//    func htmlElementWithAnimationDelayMultipleTimesRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.times(["2s", "4s"]))
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-delay-Fxvhj3{animation-delay:2s, 4s}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-Fxvhj3">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-delay with global value renders properly")
//    func htmlAnimationDelayWithGlobalValueRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.inherit)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-delay-trEDH1{animation-delay:inherit}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-trEDH1">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-delay with media query renders properly")
//    func htmlAnimationDelayWithMediaQueryRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.time("1.5s"), media: .print)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            @media print{
//              .animation-delay-1C5bE2{animation-delay:1.5s}
//            }
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-1C5bE2">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-delay with pseudo-class renders properly")
//    func htmlAnimationDelayWithPseudoClassRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.time("0.3s"), pseudo: .hover)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-delay-YE9O7d:hover{animation-delay:0.3s}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-YE9O7d">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-delay with prefix renders properly")
//    func htmlAnimationDelayWithPrefixRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.time("1s"), selector: "my-component")
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            my-component .animation-delay-KtQeSh{animation-delay:1s}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-KtQeSh">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-delay with negative time value renders properly")
//    func htmlAnimationDelayWithNegativeTimeValueRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationDelay(.time("-0.5s"))
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-delay-RfDhO3{animation-delay:-0.5s}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-delay-RfDhO3">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
// }
