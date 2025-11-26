//
//  AlignItems Tests.swift
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
        "AlignItems Tests",
    )
    struct AlignItemsTests {
        @Test("HTML element renders with align-items properly")
        func htmlElementWithAlignItemsRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignItems(.center)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .align-items-CdPBO2{align-items:center}
            
                </style>
              </head>
              <body>
            <div class="align-items-CdPBO2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with align-items flex-start value")
        func htmlElementWithAlignItemsFlexStartRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignItems(.flexStart)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .align-items-n56cj2{align-items:flex-start}
            
                </style>
              </head>
              <body>
            <div class="align-items-n56cj2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML align-items with global value renders properly")
        func htmlAlignItemsWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignItems(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .align-items-trEDH1{align-items:inherit}
            
                </style>
              </head>
              <body>
            <div class="align-items-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML align-items with media query renders properly")
        func htmlAlignItemsWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignItems(.center, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .align-items-pUz0j3{align-items:center}
            }
            
                </style>
              </head>
              <body>
            <div class="align-items-pUz0j3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML align-items with pseudo-class renders properly")
        func htmlAlignItemsWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignItems(.baseline, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .align-items-fCQVh2:hover{align-items:baseline}
            
                </style>
              </head>
              <body>
            <div class="align-items-fCQVh2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML align-items with prefix renders properly")
        func htmlAlignItemsWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignItems(.flexEnd, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .align-items-dzpgf{align-items:flex-end}
            
                </style>
              </head>
              <body>
            <div class="align-items-dzpgf">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML align-items with stretch value renders properly")
        func htmlAlignItemsWithStretchValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignItems(.stretch)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .align-items-msN8p3{align-items:stretch}
            
                </style>
              </head>
              <body>
            <div class="align-items-msN8p3">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
