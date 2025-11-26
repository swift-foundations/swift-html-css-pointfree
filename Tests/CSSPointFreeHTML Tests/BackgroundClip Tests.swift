//
//  BackgroundClip Tests.swift
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
        "BackgroundClip Tests",
    )
    struct BackgroundClipTests {
        @Test("HTML element renders with background-clip border-box properly")
        func htmlElementWithBackgroundClipBorderBoxRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.borderBox)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-clip-otfSh{background-clip:border-box}
            
                </style>
              </head>
              <body>
            <div class="background-clip-otfSh">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-clip padding-box properly")
        func htmlElementWithBackgroundClipPaddingBoxRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.paddingBox)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-clip-hWz2j2{background-clip:padding-box}
            
                </style>
              </head>
              <body>
            <div class="background-clip-hWz2j2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-clip content-box properly")
        func htmlElementWithBackgroundClipContentBoxRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.contentBox)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-clip-OOyEn1{background-clip:content-box}
            
                </style>
              </head>
              <body>
            <div class="background-clip-OOyEn1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-clip text properly")
        func htmlElementWithBackgroundClipTextRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.text)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-clip-inoYC3{background-clip:text}
            
                </style>
              </head>
              <body>
            <div class="background-clip-inoYC3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-clip with global value renders properly")
        func htmlBackgroundClipWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-clip-trEDH1{background-clip:inherit}
            
                </style>
              </head>
              <body>
            <div class="background-clip-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-clip with media query renders properly")
        func htmlBackgroundClipWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.contentBox, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .background-clip-oeEJE2{background-clip:content-box}
            }
            
                </style>
              </head>
              <body>
            <div class="background-clip-oeEJE2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-clip with pseudo-class renders properly")
        func htmlBackgroundClipWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.contentBox, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-clip-h7scE1:hover{background-clip:content-box}
            
                </style>
              </head>
              <body>
            <div class="background-clip-h7scE1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-clip with prefix renders properly")
        func htmlBackgroundClipWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundClip(.contentBox, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .background-clip-e7c0Y2{background-clip:content-box}
            
                </style>
              </head>
              <body>
            <div class="background-clip-e7c0Y2">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
