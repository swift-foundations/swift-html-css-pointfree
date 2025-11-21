import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("ProgressIndicator Element Tests")
    struct ProgressIndicatorTests {
        @Test("Basic progress renders correctly")
        func basicProgressRendersCorrectly() {
            assertInlineSnapshot(
                of: ProgressIndicator(
                    max: 100,
                    value: 50
                ) {
                    HTMLText("50%")
                },
                as: .html
            ) {
                """

                <progress value="50.0" max="100">50%
                </progress>
                """
            }
        }

        @Test("Progress without value (indeterminate) renders correctly")
        func progressWithoutValueRendersCorrectly() {
            assertInlineSnapshot(
                of: ProgressIndicator(
                    max: 100
                ) {
                    HTMLText("Loading...")
                },
                as: .html
            ) {
                """

                <progress max="100">Loading...
                </progress>
                """
            }
        }

        @Test("Progress with fractional values renders correctly")
        func progressWithFractionalValuesRendersCorrectly() {
            assertInlineSnapshot(
                of: ProgressIndicator(
                    max: 1.0,
                    value: 0.7
                ) {
                    HTMLText("70%")
                },
                as: .html
            ) {
                """

                <progress value="0.7" max="1.0">70%
                </progress>
                """
            }
        }

        @Test("Progress without content renders correctly")
        func progressWithoutContentRendersCorrectly() {
            assertInlineSnapshot(
                of: ProgressIndicator(
                    max: 100,
                    value: 75
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <progress value="75.0" max="100">
                </progress>
                """
            }
        }

        @Test("Progress within HTMLDocument renders correctly")
        func progressWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        ProgressIndicator(
                            max: 100,
                            value: 33
                        ) {
                            HTMLText("33% complete")
                        }
                    }
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
                  <body>
                <div>
                  <progress value="33.0" max="100">33% complete
                  </progress>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
