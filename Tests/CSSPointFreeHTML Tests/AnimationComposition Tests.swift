////
////  AnimationComposition Tests.swift
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
// // import DependenciesTestSupport
// import InlineSnapshotTesting
// import PointFreeHTMLTestSupport
//
// @Suite(
//    "AnimationComposition Tests",
// )
// struct AnimationCompositionTests {
//    @Test("HTML element renders with animation-composition replace properly")
//    func htmlElementWithAnimationCompositionReplaceRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationComposition(.replace)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-composition-tKSZv5{animation-composition:replace}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-composition-tKSZv5">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML element renders with animation-composition add value")
//    func htmlElementWithAnimationCompositionAddRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationComposition(.add)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-composition-2bfAc4{animation-composition:add}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-composition-2bfAc4">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML element renders with animation-composition accumulate value")
//    func htmlElementWithAnimationCompositionAccumulateRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationComposition(.accumulate)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-composition-N6c9H5{animation-composition:accumulate}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-composition-N6c9H5">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-composition with global value renders properly")
//    func htmlAnimationCompositionWithGlobalValueRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationComposition(.inherit)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-composition-trEDH1{animation-composition:inherit}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-composition-trEDH1">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-composition with media query renders properly")
//    func htmlAnimationCompositionWithMediaQueryRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationComposition(.add, media: .print)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            @media print{
//              .animation-composition-Cm0lVg{animation-composition:add}
//            }
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-composition-Cm0lVg">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-composition with pseudo-class renders properly")
//    func htmlAnimationCompositionWithPseudoClassRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationComposition(.replace, pseudo: .hover)
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            .animation-composition-Vt07jl:hover{animation-composition:replace}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-composition-Vt07jl">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
//
//    @Test("HTML animation-composition with prefix renders properly")
//    func htmlAnimationCompositionWithPrefixRendersCorrectly() throws {
//        assertInlineSnapshot(
//            of: HTMLDocument {
//                div.animationComposition(.accumulate, selector: "my-component")
//            },
//            as: .html
//        ) {
//            """
//            <!doctype html>
//            <html>
//              <head>
//                <style>
//            my-component .animation-composition-JmjCCd{animation-composition:accumulate}
//
//                </style>
//              </head>
//              <body>
//            <div class="animation-composition-JmjCCd">
//            </div>
//              </body>
//            </html>
//            """
//        }
//    }
// }
