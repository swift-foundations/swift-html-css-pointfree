//
//  BackdropFilter Tests.swift
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
        "BackdropFilter Tests",
    )
    struct BackdropFilterTests {
        @Test("HTML element renders with backdrop-filter blur properly")
        func htmlElementWithBackdropFilterBlurRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backdropFilter(.blur(.px(5)))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backdrop-filter-0kTRU{backdrop-filter:blur(5px)}
            
                </style>
              </head>
              <body>
            <div class="backdrop-filter-0kTRU">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with backdrop-filter brightness properly")
        func htmlElementWithBackdropFilterBrightnessRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backdropFilter(.brightness(1.5))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backdrop-filter-J7xul3{backdrop-filter:brightness(1.5)}
            
                </style>
              </head>
              <body>
            <div class="backdrop-filter-J7xul3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        //    @Test("HTML element renders with multiple backdrop-filters properly")
        //    func htmlElementWithMultipleBackdropFiltersRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTMLDocument {
        //                div.backdropFilter(.composite([.blur(.px(5)), .brightness(1.2)]))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .backdrop-filter-YazUw1{backdrop-filter:blur(5px) brightness(1.2)}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="backdrop-filter-YazUw1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }
        
        @Test("HTML backdrop-filter with none value renders properly")
        func htmlBackdropFilterWithNoneValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backdropFilter(BackdropFilter.none)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backdrop-filter-Wl0y44{backdrop-filter:none}
            
                </style>
              </head>
              <body>
            <div class="backdrop-filter-Wl0y44">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backdrop-filter with global value renders properly")
        func htmlBackdropFilterWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backdropFilter(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backdrop-filter-trEDH1{backdrop-filter:inherit}
            
                </style>
              </head>
              <body>
            <div class="backdrop-filter-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backdrop-filter with media query renders properly")
        func htmlBackdropFilterWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backdropFilter(.blur(.px(5)), media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .backdrop-filter-OLeyF3{backdrop-filter:blur(5px)}
            }
            
                </style>
              </head>
              <body>
            <div class="backdrop-filter-OLeyF3">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backdrop-filter with pseudo-class renders properly")
        func htmlBackdropFilterWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backdropFilter(.blur(.px(5)), pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .backdrop-filter-fPwoS2:hover{backdrop-filter:blur(5px)}
            
                </style>
              </head>
              <body>
            <div class="backdrop-filter-fPwoS2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML backdrop-filter with prefix renders properly")
        func htmlBackdropFilterWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backdropFilter(.blur(.px(5)), selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .backdrop-filter-vFyYm1{backdrop-filter:blur(5px)}
            
                </style>
              </head>
              <body>
            <div class="backdrop-filter-vFyYm1">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
