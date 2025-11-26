//
//  File.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//


import HTMLCSSPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

@Suite(
    "HTML+CSS+PointFreeHTML Tests",
    .snapshots(record: .never)
)
struct IntegrationTests {
    @Test("HTML element with attributes and styles")
    func anchorElementWithStyling() {
        assertInlineSnapshot(
            of: HTMLDocument {
                Anchor(href: "#") {
                    "Click here!"
                }
                .color(.red)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .color-0{color:red}

                </style>
              </head>
              <body><a class="color-0" href="#">Click here!</a>
              </body>
            </html>
            """
        }
    }

    @Test("General2")
    func general2() {
        assertInlineSnapshot(
            of: HTMLDocument {
                Input.button(name: "name", value: "value", disabled: false, form: nil)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>

                </style>
              </head>
              <body><input value="value" type="button" name="name">
              </body>
            </html>
            """
        }
    }

    @Test(
        "General3",
        .snapshots(record: .never)
    )
    func general3() {
        assertInlineSnapshot(
            of: HTMLDocument {
                ContentDivision {}
                    .padding(.rem(3), media: .desktop)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media only screen and (min-width: 832px){
              .padding-0{padding:3rem}
            }

                </style>
              </head>
              <body>
            <div class="padding-0">
            </div>
              </body>
            </html>
            """
        }
    }

    @Test("HTML element renders with named color properly")
    func htmlElementWithNamedColorRendersCorrectly() {
        assertInlineSnapshot(
            of: HTMLDocument {
                "Hello World"
                    .color(.named(.red))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .color-0{color:red}

                </style>
              </head>
              <body>Hello World
              </body>
            </html>
            """
        }
    }
}
