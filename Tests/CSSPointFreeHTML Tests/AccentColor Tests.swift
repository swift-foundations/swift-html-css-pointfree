//
//  AccentColor Tests.swift
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
        "AccentColor Tests",
    )
    struct AccentColorTests {
        @Test("HTML element renders with accent-color properly")
        func htmlElementWithAccentColorRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.accentColor(.red)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                .accent-color-0{accent-color:red}

                    </style>
                  </head>
                  <body>
                <div class="accent-color-0">
                </div>
                  </body>
                </html>
                """
            }
        }
        
        @Test("HTML element renders with accent-color using hex color properly")
        func htmlElementWithAccentColorHexRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.accentColor(.color(.hex("FF0000")))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .accent-color-bQ3ZC1{accent-color:#FF0000}
            
                </style>
              </head>
              <body>
            <div class="accent-color-bQ3ZC1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML accent-color with global value renders properly")
        func htmlAccentColorWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.accentColor(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .accent-color-trEDH1{accent-color:inherit}
            
                </style>
              </head>
              <body>
            <div class="accent-color-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML accent-color with media query renders properly")
        func htmlAccentColorWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.accentColor(.color(.hex("FF0000")), media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .accent-color-SXYRf2{accent-color:#FF0000}
            }
            
                </style>
              </head>
              <body>
            <div class="accent-color-SXYRf2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML accent-color with pseudo-class renders properly")
        func htmlAccentColorWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.accentColor(.color(.hex("FF0000")), pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .accent-color-egMjx3:hover{accent-color:#FF0000}
            
                </style>
              </head>
              <body>
            <div class="accent-color-egMjx3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML accent-color with prefix renders properly")
        func htmlAccentColorWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.accentColor(.color(.hex("FF0000")), selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .accent-color-XyDYD1{accent-color:#FF0000}
            
                </style>
              </head>
              <body>
            <div class="accent-color-XyDYD1">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
