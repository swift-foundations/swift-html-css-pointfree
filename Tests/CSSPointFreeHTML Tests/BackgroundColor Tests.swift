//
//  BackgroundColor Tests.swift
//  swift-html
//
//  Created by Claude AI on 11/04/2025.
//

import CSSPointFreeHTML
import CSS_Standard
import CSS_Standard
import Dependencies
import PointFreeHTML
import PointFreeHTMLTestSupport
import Testing

extension `Snapshot Tests` {
    @Suite(
        "BackgroundColor Tests",
    )
    struct BackgroundColorTests {
        @Test("HTML element renders with background-color named color properly")
        func htmlElementWithBackgroundColorNamedColorRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.red)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-color-dMYaj4{background-color:red}
            
                </style>
              </head>
              <body>
            <div class="background-color-dMYaj4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-color hex color properly")
        func htmlElementWithBackgroundColorHexRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.color(.hex("FF0000")))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-color-bQ3ZC1{background-color:#FF0000}
            
                </style>
              </head>
              <body>
            <div class="background-color-bQ3ZC1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-color rgb color properly")
        func htmlElementWithBackgroundColorRgbRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.color(.rgb(255, 0, 0)))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-color-4qnGm3{background-color:rgb(255, 0, 0)}
            
                </style>
              </head>
              <body>
            <div class="background-color-4qnGm3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-color rgba color properly")
        func htmlElementWithBackgroundColorRgbaRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.color(.rgba(255, 0, 0, 0.5)))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-color-zd1sV1{background-color:rgba(255, 0, 0, 0.5)}
            
                </style>
              </head>
              <body>
            <div class="background-color-zd1sV1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-color transparent properly")
        func htmlElementWithBackgroundColorTransparentRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.transparent)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-color-JyKaz4{background-color:transparent}
            
                </style>
              </head>
              <body>
            <div class="background-color-JyKaz4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-color with global value renders properly")
        func htmlBackgroundColorWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-color-trEDH1{background-color:inherit}
            
                </style>
              </head>
              <body>
            <div class="background-color-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-color with media query renders properly")
        func htmlBackgroundColorWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.red, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .background-color-Igguo2{background-color:red}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-Igguo2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-color with pseudo-class renders properly")
        func htmlBackgroundColorWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.red, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-color-S9wdG2:hover{background-color:red}
            
                </style>
              </head>
              <body>
            <div class="background-color-S9wdG2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-color with prefix renders properly")
        func htmlBackgroundColorWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.red, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .background-color-KoS5g3{background-color:red}
            
                </style>
              </head>
              <body>
            <div class="background-color-KoS5g3">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
