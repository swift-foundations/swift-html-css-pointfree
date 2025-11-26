//
//  BackgroundOrigin Tests.swift
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
        "BackgroundOrigin Tests",
    )
    struct BackgroundOriginTests {
        @Test("HTML element renders with background-origin border-box properly")
        func htmlElementWithBackgroundOriginBorderBoxRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundOrigin(.borderBox)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-origin-otfSh{background-origin:border-box}
            
                </style>
              </head>
              <body>
            <div class="background-origin-otfSh">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-origin padding-box properly")
        func htmlElementWithBackgroundOriginPaddingBoxRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundOrigin(.paddingBox)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-origin-hWz2j2{background-origin:padding-box}
            
                </style>
              </head>
              <body>
            <div class="background-origin-hWz2j2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-origin content-box properly")
        func htmlElementWithBackgroundOriginContentBoxRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundOrigin(.contentBox)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-origin-OOyEn1{background-origin:content-box}
            
                </style>
              </head>
              <body>
            <div class="background-origin-OOyEn1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-origin with global value renders properly")
        func htmlBackgroundOriginWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundOrigin(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-origin-trEDH1{background-origin:inherit}
            
                </style>
              </head>
              <body>
            <div class="background-origin-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-origin with media query renders properly")
        func htmlBackgroundOriginWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundOrigin(.contentBox, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .background-origin-oeEJE2{background-origin:content-box}
            }
            
                </style>
              </head>
              <body>
            <div class="background-origin-oeEJE2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-origin with pseudo-class renders properly")
        func htmlBackgroundOriginWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundOrigin(.contentBox, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-origin-h7scE1:hover{background-origin:content-box}
            
                </style>
              </head>
              <body>
            <div class="background-origin-h7scE1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-origin with prefix renders properly")
        func htmlBackgroundOriginWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundOrigin(.contentBox, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .background-origin-e7c0Y2{background-origin:content-box}
            
                </style>
              </head>
              <body>
            <div class="background-origin-e7c0Y2">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
