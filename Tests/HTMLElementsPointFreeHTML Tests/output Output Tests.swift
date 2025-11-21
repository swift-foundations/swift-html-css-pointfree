import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct OutputTests {
        @Test("Basic output renders correctly")
        func basicOutputRendersCorrectly() {
            assertInlineSnapshot(
                of: Output(
                    name: "result"
                ) {
                    HTMLText("42")
                },
                as: .html
            ) {
                """
                <output name="result">42</output>
                """
            }
        }

        @Test("Output with for attribute renders correctly")
        func outputWithForAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Output(
                    `for`: "calculation",
                    name: "sum"
                ) {
                    HTMLText("100")
                },
                as: .html
            ) {
                """
                <output name="sum" for="calculation">100</output>
                """
            }
        }

        @Test("Output with form attribute renders correctly")
        func outputWithFormAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Output(
                    `for`: "input1 input2",
                    form: "calculator",
                    name: "total"
                ) {
                    HTMLText("Sum: 150")
                },
                as: .html
            ) {
                """
                <output name="total" form="calculator" for="input1 input2">Sum: 150</output>
                """
            }
        }

        @Test("Output within HTMLDocument renders correctly")
        func outputWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Output(
                            `for`: "slider",
                            name: "value"
                        ) {
                            HTMLText("50")
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
                <div><output name="value" for="slider">50</output>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
