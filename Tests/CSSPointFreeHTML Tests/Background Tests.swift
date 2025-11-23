//
//  Background Tests.swift
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
        "Background Tests",
        .snapshots(record: .failed)
    )
    struct BackgroundTests {
        @Test("HTML element renders with background color properly")
        func htmlElementWithBackgroundColorRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.background(.red)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-dMYaj4{background:red}
            
                </style>
              </head>
              <body>
            <div class="background-dMYaj4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element renders with background image properly")
        func htmlElementWithBackgroundImageRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.background(.image("image.jpg"))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-xvS5W{background:url("image.jpg")}
            
                </style>
              </head>
              <body>
            <div class="background-xvS5W">
            </div>
              </body>
            </html>
            """
            }
        }
        
        //    @Test("HTML element renders with complex background properly")
        //    func htmlElementWithComplexBackgroundRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTMLDocument {
        //                div.background(.composite([.color(.red), .image(.url("image.jpg"))]))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .background-yFkjt1{background:red url("image.jpg")}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="background-yFkjt1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }
        
        @Test("HTML background with none value renders properly")
        func htmlBackgroundWithNoneValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.background(Background.none)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-Wl0y44{background:none}
            
                </style>
              </head>
              <body>
            <div class="background-Wl0y44">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background with global value renders properly")
        func htmlBackgroundWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.background(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-trEDH1{background:inherit}
            
                </style>
              </head>
              <body>
            <div class="background-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background with media query renders properly")
        func htmlBackgroundWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.background(.red, media: .print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media print{
              .background-Igguo2{background:red}
            }
            
                </style>
              </head>
              <body>
            <div class="background-Igguo2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background with pseudo-class renders properly")
        func htmlBackgroundWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.background(.red, pseudo: .hover)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-S9wdG2:hover{background:red}
            
                </style>
              </head>
              <body>
            <div class="background-S9wdG2">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background with prefix renders properly")
        func htmlBackgroundWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.background(.red, selector: "my-component")
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            my-component .background-KoS5g3{background:red}
            
                </style>
              </head>
              <body>
            <div class="background-KoS5g3">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
