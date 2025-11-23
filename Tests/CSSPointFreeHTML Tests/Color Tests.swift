//
//  Color Tests.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
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
        "Color Tests",
    )
    struct ColorTests {
        @Test("HTML element renders with named color properly")
        func htmlElementWithNamedColorRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div
                        .color(.red)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .color-dMYaj4{color:red}
            
                </style>
              </head>
              <body>
            <div class="color-dMYaj4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML color method with pseudo-class parameter")
        func htmlColorMethodWithPseudoClassParameter() throws {
            
            let test = HTMLDocument {
                div
                    .color(.hex("FF0000"), pseudo: .hover)
                
            }
            
            let html = String(bytes: test.render(), encoding: .utf8)!
            #expect(html.contains(":hover"))
            #expect(html.contains("color:#FF0000"))
            
        }
        
        @Test("HTML color with Color renders properly")
        func htmlColorMethodWithColorWorks() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div
                        .color(Color.color(.hex("FF0000")))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .color-bQ3ZC1{color:#FF0000}
            
                </style>
              </head>
              <body>
            <div class="color-bQ3ZC1">
            </div>
              </body>
            </html>
            """
            }
        }
        
    }
}
