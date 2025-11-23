//
//  AnchorName Tests.swift
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
        "AnchorName Tests",
    )
    struct AnchorNameTests {
        @Test("HTML element renders with anchor-name string value properly")
        func htmlElementWithAnchorNameStringRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.anchorName("section-header")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .anchor-name-rqwxL3{anchor-name:--section-header}
            
                </style>
              </head>
              <body>
            <div class="anchor-name-rqwxL3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with anchor-name none value")
        func htmlElementWithAnchorNameNoneRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.anchorName(AnchorName.none)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .anchor-name-Wl0y44{anchor-name:none}
            
                </style>
              </head>
              <body>
            <div class="anchor-name-Wl0y44">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML anchor-name with global value renders properly")
        func htmlAnchorNameWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.anchorName(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .anchor-name-trEDH1{anchor-name:inherit}
            
                </style>
              </head>
              <body>
            <div class="anchor-name-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML anchor-name with media query renders properly")
        func htmlAnchorNameWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.anchorName("section-intro", media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .anchor-name-KbwKJ1{anchor-name:--section-intro}
            }
            
                </style>
              </head>
              <body>
            <div class="anchor-name-KbwKJ1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML anchor-name with pseudo-class renders properly")
        func htmlAnchorNameWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.anchorName("heading", pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .anchor-name-0ysQc1:hover{anchor-name:--heading}
            
                </style>
              </head>
              <body>
            <div class="anchor-name-0ysQc1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML anchor-name with prefix renders properly")
        func htmlAnchorNameWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.anchorName("footer", selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .anchor-name-xBtcq3{anchor-name:--footer}
            
                </style>
              </head>
              <body>
            <div class="anchor-name-xBtcq3">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
