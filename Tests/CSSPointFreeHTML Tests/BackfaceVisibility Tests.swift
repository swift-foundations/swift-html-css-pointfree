//
//  BackfaceVisibility Tests.swift
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
        "BackfaceVisibility Tests",
    )
    struct BackfaceVisibilityTests {
        @Test("HTML element renders with backface-visibility hidden properly")
        func htmlElementWithBackfaceVisibilityHiddenRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backfaceVisibility(.hidden)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backface-visibility-PhNC81{backface-visibility:hidden}
            
                </style>
              </head>
              <body>
            <div class="backface-visibility-PhNC81">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with backface-visibility visible properly")
        func htmlElementWithBackfaceVisibilityVisibleRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backfaceVisibility(.visible)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backface-visibility-wd16m4{backface-visibility:visible}
            
                </style>
              </head>
              <body>
            <div class="backface-visibility-wd16m4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backface-visibility with global value renders properly")
        func htmlBackfaceVisibilityWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backfaceVisibility(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backface-visibility-trEDH1{backface-visibility:inherit}
            
                </style>
              </head>
              <body>
            <div class="backface-visibility-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backface-visibility with media query renders properly")
        func htmlBackfaceVisibilityWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backfaceVisibility(.hidden, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .backface-visibility-G9iVz2{backface-visibility:hidden}
            }
            
                </style>
              </head>
              <body>
            <div class="backface-visibility-G9iVz2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backface-visibility with pseudo-class renders properly")
        func htmlBackfaceVisibilityWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backfaceVisibility(.hidden, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backface-visibility-dLjCw:hover{backface-visibility:hidden}
            
                </style>
              </head>
              <body>
            <div class="backface-visibility-dLjCw">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backface-visibility with prefix renders properly")
        func htmlBackfaceVisibilityWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backfaceVisibility(.hidden, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .backface-visibility-iXV9h3{backface-visibility:hidden}
            
                </style>
              </head>
              <body>
            <div class="backface-visibility-iXV9h3">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
