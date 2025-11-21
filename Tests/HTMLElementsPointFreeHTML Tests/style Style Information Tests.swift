import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Style Information Element Tests")
    struct StyleTests {
        @Test("Basic style renders correctly")
        func basicStyleRendersCorrectly() {
            assertInlineSnapshot(
                of: Style {
                    HTMLText("body { margin: 0; }")
                },
                as: .html
            ) {
                """

                <style>body { margin: 0; }
                </style>
                """
            }
        }

        @Test("Style with type attribute renders correctly")
        func styleWithTypeAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Style {
                    HTMLText("body { background: blue; }")
                }
                .attribute("type", "text/css"),
                as: .html
            ) {
                """

                <style type="text/css">body { background: blue; }
                </style>
                """
            }
        }

        @Test("Style with media attribute renders correctly")
        func styleWithMediaAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Style {
                    HTMLText("body { font-size: 18px; }")
                }
                .attribute("media", "screen and (min-width: 768px)"),
                as: .html
            ) {
                """

                <style media="screen and (min-width: 768px)">body { font-size: 18px; }
                </style>
                """
            }
        }

        @Test("Style with title attribute renders correctly")
        func styleWithTitleAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Style {
                    HTMLText(".theme-dark { background: #333; color: #fff; }")
                }
                .attribute("title", "Dark Theme"),
                as: .html
            ) {
                """

                <style title="Dark Theme">.theme-dark { background: #333; color: #fff; }
                </style>
                """
            }
        }

        @Test("Complex CSS style renders correctly")
        func complexCSSStyleRendersCorrectly() {
            assertInlineSnapshot(
                of: Style {
                    HTMLText(
                        """
                        .container {
                          max-width: 1200px;
                          margin: 0 auto;
                          padding: 20px;
                        }

                        @media (max-width: 768px) {
                          .container {
                            padding: 10px;
                          }
                        }
                        """
                    )
                },
                as: .html
            ) {
                """

                <style>.container {
                  max-width: 1200px;
                  margin: 0 auto;
                  padding: 20px;
                }

                @media (max-width: 768px) {
                  .container {
                    padding: 10px;
                  }
                }
                </style>
                """
            }
        }

        @Test("Style with nonce attribute renders correctly")
        func styleWithNonceAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Style {
                    HTMLText("body { font-family: Arial, sans-serif; }")
                }
                .attribute("nonce", "abc123def456"),
                as: .html
            ) {
                """

                <style nonce="abc123def456">body { font-family: Arial, sans-serif; }
                </style>
                """
            }
        }

        @Test("Empty style renders correctly")
        func emptyStyleRendersCorrectly() {
            assertInlineSnapshot(
                of: Style {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <style>
                </style>
                """
            }
        }
    }
}
