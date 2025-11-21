import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Samp Element Tests")
    struct SampTests {
        @Test("Basic samp renders correctly")
        func basicSampRendersCorrectly() {
            assertInlineSnapshot(
                of: Samp {
                    HTMLText("Hello, World!")
                },
                as: .html
            ) {
                """
                <samp>Hello, World!</samp>
                """
            }
        }

        @Test("Samp for program output renders correctly")
        func sampForProgramOutputRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("When you run the command ")
                    KeyboardInput {
                        HTMLText("ls -la")
                    }
                    HTMLText(", you will see output like: ")
                    Samp {
                        HTMLText("-rw-r--r-- 1 user staff 1024 Jan 15 10:30 file.txt")
                    }
                },
                as: .html
            ) {
                """

                <p>When you run the command <kbd>ls -la</kbd>, you will see output like: <samp>-rw-r--r-- 1 user staff 1024 Jan 15 10:30 file.txt</samp>
                </p>
                """
            }
        }

        @Test("Samp in code documentation renders correctly")
        func sampInCodeDocumentationRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    Paragraph {
                        HTMLText("The ")
                        Code {
                            HTMLText("print()")
                        }
                        HTMLText(" function will output: ")
                        Samp {
                            HTMLText("Python 3.9.0")
                        }
                    }
                    PreformattedText {
                        Code {
                            HTMLText(">>> import sys\n>>> print(sys.version)\n")
                        }
                        Samp {
                            HTMLText(
                                "3.9.0 (default, Oct  9 2020, 15:24:06)\n[Clang 12.0.0 (clang-1200.0.32.29)] on darwin"
                            )
                        }
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <p>The <code>print()</code> function will output: <samp>Python 3.9.0</samp>
                  </p>
                  <pre><code>&gt;&gt;&gt; import sys
                &gt;&gt;&gt; print(sys.version)
                </code><samp>3.9.0 (default, Oct  9 2020, 15:24:06)
                [Clang 12.0.0 (clang-1200.0.32.29)] on darwin</samp></pre>
                </div>
                """
            }
        }

        @Test("Samp for error messages renders correctly")
        func sampForErrorMessagesRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    Paragraph {
                        HTMLText("If the file doesn't exist, you'll see an error:")
                    }
                    Samp {
                        HTMLText(
                            "FileNotFoundError: [Errno 2] No such file or directory: 'missing.txt'"
                        )
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <p>If the file doesn't exist, you'll see an error:
                  </p><samp>FileNotFoundError: [Errno 2] No such file or directory: 'missing.txt'</samp>
                </div>
                """
            }
        }

        @Test("Samp with multiple outputs renders correctly")
        func sampWithMultipleOutputsRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    Paragraph {
                        HTMLText("Running the test suite produces the following results:")
                    }
                    PreformattedText {
                        Samp {
                            HTMLText(
                                """
                                Running tests...
                                ✓ test_addition passed
                                ✓ test_subtraction passed
                                ✗ test_division failed

                                2 passed, 1 failed
                                """
                            )
                        }
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <p>Running the test suite produces the following results:
                  </p>
                  <pre><samp>Running tests...
                ✓ test_addition passed
                ✓ test_subtraction passed
                ✗ test_division failed

                2 passed, 1 failed</samp></pre>
                </div>
                """
            }
        }

        @Test("Samp within HTMLDocument renders correctly")
        func sampWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Command Line Tutorial")
                        }
                        Section {
                            H3 {
                                HTMLText("Basic Commands")
                            }
                            Paragraph {
                                HTMLText("Use ")
                                KeyboardInput {
                                    HTMLText("pwd")
                                }
                                HTMLText(" to see your current directory:")
                            }
                            PreformattedText {
                                Code {
                                    HTMLText("$ pwd")
                                }
                                HTMLText("\n")
                                Samp {
                                    HTMLText("/Users/username/Documents")
                                }
                            }
                            Paragraph {
                                HTMLText("Use ")
                                KeyboardInput {
                                    HTMLText("date")
                                }
                                HTMLText(" to see the current date and time:")
                            }
                            PreformattedText {
                                Code {
                                    HTMLText("$ date")
                                }
                                HTMLText("\n")
                                Samp {
                                    HTMLText("Mon Jan 15 14:30:25 PST 2024")
                                }
                            }
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
                <article>
                  <h2>Command Line Tutorial
                  </h2>
                  <section>
                    <h3>Basic Commands
                    </h3>
                    <p>Use <kbd>pwd</kbd> to see your current directory:
                    </p>
                    <pre><code>$ pwd</code>
                <samp>/Users/username/Documents</samp></pre>
                    <p>Use <kbd>date</kbd> to see the current date and time:
                    </p>
                    <pre><code>$ date</code>
                <samp>Mon Jan 15 14:30:25 PST 2024</samp></pre>
                  </section>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
