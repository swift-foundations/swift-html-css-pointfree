////
////  Animation Tests.swift
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
// "3s ease-in 1s infinite reverse both running slidein"
//
// @Suite(
//    "Animation Tests",
// )
// struct AnimationTests {
//    @Test("HTML element renders with animation string value properly")
//    func htmlElementWithAnimationStringRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animation(.init(.duration(.s(3)), .timingFunction(.easeIn), .duration(.s(3)), .))
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-RzKmLe{animation:3s ease-in 1s infinite reverse both running slidein}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-RzKmLe">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML element renders with animation simple value")
//    func htmlElementWithAnimationSimpleRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animation(.string("fadeIn 2s"))
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-WkDfA3{animation:fadeIn 2s}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-WkDfA3">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation with global value renders properly")
//    func htmlAnimationWithGlobalValueRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animation(.inherit)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-trEDH1{animation:inherit}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-trEDH1">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation with media query renders properly")
//    func htmlAnimationWithMediaQueryRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animation(.string("bounce 1s"), media: .print)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            @media print{
//              .animation-4k5svo{animation:bounce 1s}
//            }
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-4k5svo">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation with pseudo-class renders properly")
//    func htmlAnimationWithPseudoClassRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animation(.string("pulse 3s infinite"), pseudo: .hover)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-pG3fH2:hover{animation:pulse 3s infinite}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-pG3fH2">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation with prefix renders properly")
//    func htmlAnimationWithPrefixRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animation(.string("slide 2s ease-out"), selector: "my-component")
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            my-component .animation-9LLdQl{animation:slide 2s ease-out}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-9LLdQl">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation with none value renders properly")
//    func htmlAnimationWithNoneValueRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animation(.none)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-3ZLVsZ{animation:none}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-3ZLVsZ">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
// }
