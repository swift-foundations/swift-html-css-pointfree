//
//  BackgroundBlendMode Tests.swift
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
        "BackgroundBlendMode Tests",
    )
    struct BackgroundBlendModeTests {
        @Test("HTML element renders with background-blend-mode normal properly")
        func htmlElementWithBackgroundBlendModeNormalRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.normal)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-blend-mode-evfWi1{background-blend-mode:normal}
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-evfWi1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-blend-mode multiply properly")
        func htmlElementWithBackgroundBlendModeMultiplyRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.multiply)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-blend-mode-gumfc1{background-blend-mode:multiply}
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-gumfc1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-blend-mode screen properly")
        func htmlElementWithBackgroundBlendModeScreenRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.screen)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-blend-mode-a7c473{background-blend-mode:screen}
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-a7c473">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background-blend-mode overlay properly")
        func htmlElementWithBackgroundBlendModeOverlayRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.overlay)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-blend-mode-UX3lO1{background-blend-mode:overlay}
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-UX3lO1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-blend-mode with global value renders properly")
        func htmlBackgroundBlendModeWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-blend-mode-trEDH1{background-blend-mode:inherit}
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-blend-mode with media query renders properly")
        func htmlBackgroundBlendModeWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.multiply, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .background-blend-mode-B2231{background-blend-mode:multiply}
            }
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-B2231">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-blend-mode with pseudo-class renders properly")
        func htmlBackgroundBlendModeWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.multiply, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-blend-mode-kQHf41:hover{background-blend-mode:multiply}
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-kQHf41">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-blend-mode with prefix renders properly")
        func htmlBackgroundBlendModeWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundBlendMode(.multiply, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .background-blend-mode-QWNBt2{background-blend-mode:multiply}
            
                </style>
              </head>
              <body>
            <div class="background-blend-mode-QWNBt2">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
