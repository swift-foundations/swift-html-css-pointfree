import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Code Element Tests")
    struct CodeTests {
        @Test("Basic code renders correctly")
        func basicCodeRendersCorrectly() {
            assertInlineSnapshot(
                of: Code {
                    HTMLText("console.log('Hello, World!');")
                },
                as: .html
            ) {
                """
                <code>console.log('Hello, World!');</code>
                """
            }
        }

        @Test("Code within text renders correctly")
        func codeWithinTextRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Use the ")
                    Code {
                        HTMLText("Array.map()")
                    }
                    HTMLText(" method to transform arrays.")
                },
                as: .html
            ) {
                """

                <p>Use the <code>Array.map()</code> method to transform arrays.
                </p>
                """
            }
        }

        @Test("Code with HTML entities renders correctly")
        func codeWithHTMLEntitiesRendersCorrectly() {
            assertInlineSnapshot(
                of: Code {
                    HTMLText("<div>Hello</div>")
                },
                as: .html
            ) {
                """
                <code>&lt;div&gt;Hello&lt;/div&gt;</code>
                """
            }
        }

        @Test("Code within pre renders correctly")
        func codeWithinPreRendersCorrectly() {
            assertInlineSnapshot(
                of: PreformattedText {
                    Code {
                        HTMLText(
                            """
                            function fibonacci(n) {
                                if (n <= 1) return n;
                                return fibonacci(n - 1) + fibonacci(n - 2);
                            }
                            """
                        )
                    }
                },
                as: .html
            ) {
                """

                <pre><code>function fibonacci(n) {
                    if (n &lt;= 1) return n;
                    return fibonacci(n - 1) + fibonacci(n - 2);
                }</code></pre>
                """
            }
        }

        @Test("Code within HTMLDocument renders correctly")
        func codeWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        HTMLText("The variable ")
                        Code {
                            HTMLText("userName")
                        }
                        HTMLText(" stores the user's name.")
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
                <div>The variable <code>userName</code> stores the user's name.
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
