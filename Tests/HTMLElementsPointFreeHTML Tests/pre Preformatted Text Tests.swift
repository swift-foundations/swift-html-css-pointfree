import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("PreformattedText Element Tests")
    struct PreformattedTextTests {
        @Test("Basic pre renders correctly")
        func basicPreRendersCorrectly() {
            assertInlineSnapshot(
                of: PreformattedText {
                    HTMLText(
                        "This is preformatted text.\nSpaces    and    tabs    are    preserved.\nLine breaks are also preserved."
                    )
                },
                as: .html
            ) {
                """

                <pre>This is preformatted text.
                Spaces    and    tabs    are    preserved.
                Line breaks are also preserved.</pre>
                """
            }
        }

        @Test("Pre with code block renders correctly")
        func preWithCodeBlockRendersCorrectly() {
            assertInlineSnapshot(
                of: PreformattedText {
                    Code {
                        HTMLText(
                            """
                            function fibonacci(n) {
                                if (n <= 1) return n;
                                return fibonacci(n - 1) + fibonacci(n - 2);
                            }

                            console.log(fibonacci(10)); // Output: 55
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
                }

                console.log(fibonacci(10)); // Output: 55</code></pre>
                """
            }
        }

        @Test("Pre with ASCII art renders correctly")
        func preWithAsciiArtRendersCorrectly() {
            assertInlineSnapshot(
                of: PreformattedText {
                    HTMLText(
                        """
                           /\\_/\\
                          (  o.o  )
                           > ^ <
                        """
                    )
                },
                as: .html
            ) {
                #"""

                <pre>   /\_/\
                  (  o.o  )
                   &gt; ^ &lt;</pre>
                """#
            }
        }

        @Test("Pre with formatted data renders correctly")
        func preWithFormattedDataRendersCorrectly() {
            assertInlineSnapshot(
                of: PreformattedText {
                    HTMLText(
                        """
                        Name          Age    City
                        ------------- ------ -------------
                        John Doe      30     New York
                        Jane Smith    25     Los Angeles
                        Bob Johnson   35     Chicago
                        """
                    )
                },
                as: .html
            ) {
                """

                <pre>Name          Age    City
                ------------- ------ -------------
                John Doe      30     New York
                Jane Smith    25     Los Angeles
                Bob Johnson   35     Chicago</pre>
                """
            }
        }

        @Test("Pre with mixed content renders correctly")
        func preWithMixedContentRendersCorrectly() {
            assertInlineSnapshot(
                of: PreformattedText {
                    HTMLText("Error log:\n")
                    StrongImportance {
                        HTMLText("ERROR:")
                    }
                    HTMLText(" Connection timeout at ")
                    Code {
                        HTMLText("192.168.1.1:3306")
                    }
                    HTMLText("\n")
                    Emphasis {
                        HTMLText("WARN:")
                    }
                    HTMLText("  Retrying connection...\n")
                    StrongImportance {
                        HTMLText("INFO:")
                    }
                    HTMLText("  Connection restored")
                },
                as: .html
            ) {
                """

                <pre>Error log:
                <strong>ERROR:</strong> Connection timeout at <code>192.168.1.1:3306</code>
                <em>WARN:</em>  Retrying connection...
                <strong>INFO:</strong>  Connection restored</pre>
                """
            }
        }

        @Test("PreformattedText within HTMLDocument renders correctly")
        func preformattedTextWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Code Example")
                        }
                        Paragraph {
                            HTMLText("Here's a simple Python function:")
                        }
                        PreformattedText {
                            Code {
                                HTMLText(
                                    """
                                    def greet(name):
                                        \"\"\"
                                        Greets a person with their name.

                                        Args:
                                            name (str): The person's name

                                        Returns:
                                            str: A greeting message
                                        \"\"\"
                                        return f"Hello, {name}!"

                                    # Example usage
                                    message = greet("World")
                                    print(message)  # Output: Hello, World!
                                    """
                                )
                            }
                        }
                        Paragraph {
                            HTMLText(
                                "This function demonstrates basic Python syntax including docstrings and f-string formatting."
                            )
                        }
                    }
                },
                as: .html
            ) {
                #"""
                <!doctype html>
                <html>
                  <head>
                    <style>

                    </style>
                  </head>
                  <body>
                <article>
                  <h2>Code Example
                  </h2>
                  <p>Here's a simple Python function:
                  </p>
                  <pre><code>def greet(name):
                    """
                    Greets a person with their name.

                    Args:
                        name (str): The person's name

                    Returns:
                        str: A greeting message
                    """
                    return f"Hello, {name}!"

                # Example usage
                message = greet("World")
                print(message)  # Output: Hello, World!</code></pre>
                  <p>This function demonstrates basic Python syntax including docstrings and f-string formatting.
                  </p>
                </article>
                  </body>
                </html>
                """#
            }
        }
    }
}
