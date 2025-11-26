//
//  AspectRatio Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSSPointFreeHTML
import CSS_Standard
import CSS_Standard
import PointFreeHTML
import PointFreeHTMLTestSupport
import Testing

extension `Snapshot Tests` {
    @Suite(
        "AspectRatio Tests",
    )
    struct AspectRatioTests {
        @Test("HTML element renders with aspect-ratio properly")
        func htmlElementWithAspectRatioRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.aspectRatio(try! .ratio(16, 9))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .aspect-ratio-10XyA2{aspect-ratio:16 / 9}
            
                </style>
              </head>
              <body>
            <div class="aspect-ratio-10XyA2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with different aspect-ratio value properly")
        func htmlElementWithDifferentAspectRatioRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.aspectRatio(try! .ratio(4, 3))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .aspect-ratio-kDJuQ2{aspect-ratio:4 / 3}
            
                </style>
              </head>
              <body>
            <div class="aspect-ratio-kDJuQ2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with auto aspect-ratio properly")
        func htmlElementWithAutoAspectRatioRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.aspectRatio(try! .auto)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .aspect-ratio-u7yQf2{aspect-ratio:auto}
            
                </style>
              </head>
              <body>
            <div class="aspect-ratio-u7yQf2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML aspect-ratio with global value renders properly")
        func htmlAspectRatioWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.aspectRatio(try! .inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .aspect-ratio-trEDH1{aspect-ratio:inherit}
            
                </style>
              </head>
              <body>
            <div class="aspect-ratio-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML aspect-ratio with media query renders properly")
        func htmlAspectRatioWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.aspectRatio(try! .ratio(16, 9), media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .aspect-ratio-WCwgo4{aspect-ratio:16 / 9}
            }
            
                </style>
              </head>
              <body>
            <div class="aspect-ratio-WCwgo4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML aspect-ratio with pseudo-class renders properly")
        func htmlAspectRatioWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.aspectRatio(try! .ratio(16, 9), pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .aspect-ratio-eQOer3:hover{aspect-ratio:16 / 9}
            
                </style>
              </head>
              <body>
            <div class="aspect-ratio-eQOer3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML aspect-ratio with prefix renders properly")
        func htmlAspectRatioWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.aspectRatio(try! .ratio(16, 9), selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .aspect-ratio-Dmiak4{aspect-ratio:16 / 9}
            
                </style>
              </head>
              <body>
            <div class="aspect-ratio-Dmiak4">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
