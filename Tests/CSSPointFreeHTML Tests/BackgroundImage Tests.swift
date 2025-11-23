//
//  BackgroundImage Tests.swift
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
        "BackgroundImage Tests",
    )
    struct BackgroundImageTests {
        @Test("HTML element renders with background-image url properly")
        func htmlElementWithBackgroundImageUrlRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundImage(.url("image.jpg"))
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                .background-image-xvS5W{background-image:url("image.jpg")}

                    </style>
                  </head>
                  <body>
                <div class="background-image-xvS5W">
                </div>
                  </body>
                </html>
                """
            }
        }
        
        //    @Test("HTML element renders with background-image linear-gradient properly")
        //    func htmlElementWithBackgroundImageLinearGradientRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTMLDocument {
        //                div.backgroundImage(.linearGradient(degree: 45, .color(.red), .color(.blue)))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .background-image-EdcYg1{background-image:linear-gradient(45deg, red, blue)}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="background-image-EdcYg1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }
        //
        //    @Test("HTML element renders with background-image radial-gradient properly")
        //    func htmlElementWithBackgroundImageRadialGradientRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTMLDocument {
        //                div.backgroundImage(.radialGradient(.color(.red), .color(.blue)))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .background-image-kbqMx1{background-image:radial-gradient(red, blue)}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="background-image-kbqMx1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }
        //
        //    @Test("HTML element renders with multiple background-images properly")
        //    func htmlElementWithMultipleBackgroundImagesRendersCorrectly() throws {
        //        assertInlineSnapshot(
        //            of: HTMLDocument {
        //                div.backgroundImage(.composite([.url("image1.jpg"), .url("image2.jpg")]))
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <!doctype html>
        //            <html>
        //              <head>
        //                <style>
        //            .background-image-PsRHs1{background-image:url("image1.jpg"), url("image2.jpg")}
        //
        //                </style>
        //              </head>
        //              <body>
        //            <div class="background-image-PsRHs1">
        //            </div>
        //              </body>
        //            </html>
        //            """
        //        }
        //    }
        
        @Test("HTML background-image with none value renders properly")
        func htmlBackgroundImageWithNoneValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundImage(BackgroundImage.none)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-image-Wl0y44{background-image:none}
            
                </style>
              </head>
              <body>
            <div class="background-image-Wl0y44">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-image with global value renders properly")
        func htmlBackgroundImageWithGlobalValueRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundImage(.inherit)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            .background-image-trEDH1{background-image:inherit}
            
                </style>
              </head>
              <body>
            <div class="background-image-trEDH1">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML background-image with media query renders properly")
        func htmlBackgroundImageWithMediaQueryRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundImage(.url("image.jpg"), media: .print)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                @media print{
                  .background-image-Qynyc2{background-image:url("image.jpg")}
                }

                    </style>
                  </head>
                  <body>
                <div class="background-image-Qynyc2">
                </div>
                  </body>
                </html>
                """
            }
        }
        
        @Test("HTML background-image with pseudo-class renders properly")
        func htmlBackgroundImageWithPseudoClassRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundImage(.url("image.jpg"), pseudo: .hover)
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                .background-image-ZMxdr:hover{background-image:url("image.jpg")}

                    </style>
                  </head>
                  <body>
                <div class="background-image-ZMxdr">
                </div>
                  </body>
                </html>
                """
            }
        }
        
        @Test("HTML background-image with prefix renders properly")
        func htmlBackgroundImageWithPrefixRendersCorrectly() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundImage(.url("image.jpg"), selector: "my-component")
                },
                as: .html
            ) {
                """
                <!doctype html>
                <html>
                  <head>
                    <style>
                my-component .background-image-5Z5hU2{background-image:url("image.jpg")}

                    </style>
                  </head>
                  <body>
                <div class="background-image-5Z5hU2">
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
