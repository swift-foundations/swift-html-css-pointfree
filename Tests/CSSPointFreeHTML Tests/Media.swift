import CSSPointFreeHTML
import CSS_Standard
import Dependencies
import PointFreeHTML
import PointFreeHTMLTestSupport
import Testing

extension `Snapshot Tests` {
    @Suite(
        "Media Tests",
    )
    struct MediaTests {
        @Test("HTML element rendering with basic media query")
        func htmlElementRenderingWithBasicMediaQuery() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.blue, media: .screen)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media screen{
              .background-color-uBpH12{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-uBpH12">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with complex media query")
        func htmlElementRenderingWithComplexMediaQuery() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(
                        .blue,
                        media: Media.screen
                            .and(.maxWidth(.px(500)))
                            .and(.prefersColorScheme(.dark))
                    )
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media screen and (max-width: 500px) and (prefers-color-scheme: dark){
              .background-color-SagMo4{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-SagMo4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with negated media query")
        func htmlElementRenderingWithNegatedMediaQuery() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.blue, media: !Media.print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media not print{
              .background-color-KGCk11{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-KGCk11">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with media OR query")
        func htmlElementRenderingWithMediaOrQuery() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.blue, media: Media.screen || Media.print)
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media screen, print{
              .background-color-VhiXL{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-VhiXL">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with only operator")
        func htmlElementRenderingWithOnlyOperator() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.blue, media: Media.screen.only())
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media only screen{
              .background-color-bIbz14{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-bIbz14">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with feature-only media query")
        func htmlElementRenderingWithFeatureOnlyMediaQuery() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div.backgroundColor(.blue, media: .prefersColorScheme(.dark))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media (prefers-color-scheme: dark){
              .background-color-mMg2X{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-mMg2X">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with multiple properties in media query")
        func htmlElementRenderingWithMultiplePropertiesInMediaQuery() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div
                        .backgroundColor(.blue, media: Media.screen && .maxWidth(.px(768)))
                        .color(.white, media: Media.screen && .maxWidth(.px(768)))
                        .padding(.px(20), media: Media.screen && .maxWidth(.px(768)))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media screen and (max-width: 768px){
              .padding-JBzfL{padding:20px}
              .color-iseje4{color:white}
              .background-color-eGELe4{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="padding-JBzfL color-iseje4 background-color-eGELe4">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with media query and pseudo-class")
        func htmlElementRenderingWithMediaQueryAndPseudoClass() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div
                        .backgroundColor(.blue, media: .screen && .minWidth(.px(768)))
                        .backgroundColor(.red, media: Media.screen && .minWidth(.px(768)))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media screen and (min-width: 768px){
              .background-color-WW2GU3{background-color:red}
              .background-color-9Kjb11{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="background-color-WW2GU3 background-color-9Kjb11">
            </div>
              </body>
            </html>
            """
            }
        }
        
        @Test("HTML element rendering with multiple media queries")
        func htmlElementRenderingWithMultipleMediaQueries() throws {
            assertInlineSnapshot(
                of: HTMLDocument {
                    div
                        .backgroundColor(.blue, media: .screen && .minWidth(.px(768)))
                        .color(.white, media: .screen && .prefersColorScheme(.dark))
                },
                as: .html
            ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
            @media screen and (prefers-color-scheme: dark){
              .color-ewDba1{color:white}
            }
            @media screen and (min-width: 768px){
              .background-color-9Kjb11{background-color:blue}
            }
            
                </style>
              </head>
              <body>
            <div class="color-ewDba1 background-color-9Kjb11">
            </div>
              </body>
            </html>
            """
            }
        }
    }
}
