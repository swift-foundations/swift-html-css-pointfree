//
//  AlignmentBaseline Tests.swift
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
        "AlignmentBaseline Tests",
    )
    struct AlignmentBaselineTests {
        @Test("HTML element renders with alignment-baseline properly")
        func htmlElementWithAlignmentBaselineRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignmentBaseline(.baseline)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .alignment-baseline-0Zubr3{alignment-baseline:baseline}
            
                </style>
              </head>
              <body>
            <div class="alignment-baseline-0Zubr3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with alignment-baseline text-bottom value")
        func htmlElementWithAlignmentBaselineTextBottomRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignmentBaseline(.textBottom)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .alignment-baseline-1AOeT2{alignment-baseline:text-bottom}
            
                </style>
              </head>
              <body>
            <div class="alignment-baseline-1AOeT2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML alignment-baseline with global value renders properly")
        func htmlAlignmentBaselineWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignmentBaseline(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .alignment-baseline-trEDH1{alignment-baseline:inherit}
            
                </style>
              </head>
              <body>
            <div class="alignment-baseline-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML alignment-baseline with media query renders properly")
        func htmlAlignmentBaselineWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignmentBaseline(.middle, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .alignment-baseline-XU4H84{alignment-baseline:middle}
            }
            
                </style>
              </head>
              <body>
            <div class="alignment-baseline-XU4H84">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML alignment-baseline with pseudo-class renders properly")
        func htmlAlignmentBaselineWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignmentBaseline(.central, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .alignment-baseline-eg5PJ:hover{alignment-baseline:central}
            
                </style>
              </head>
              <body>
            <div class="alignment-baseline-eg5PJ">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML alignment-baseline with prefix renders properly")
        func htmlAlignmentBaselineWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignmentBaseline(.textTop, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .alignment-baseline-hdTb2{alignment-baseline:text-top}
            
                </style>
              </head>
              <body>
            <div class="alignment-baseline-hdTb2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML alignment-baseline with after-edge value renders properly")
        func htmlAlignmentBaselineWithAfterEdgeValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.alignmentBaseline(.afterEdge)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .alignment-baseline-DgkWX2{alignment-baseline:after-edge}
            
                </style>
              </head>
              <body>
            <div class="alignment-baseline-DgkWX2">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
