import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct KeyboardInputTests {
        @Test("Basic kbd renders correctly")
        func basicKbdRendersCorrectly() {
            assertInlineSnapshot(
                of: KeyboardInput {
                    HTMLText("Ctrl")
                },
                as: .html
            ) {
                """
                <kbd>Ctrl</kbd>
                """
            }
        }

        @Test("Kbd for keyboard shortcuts renders correctly")
        func kbdForKeyboardShortcutsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("Press ")
                    KeyboardInput {
                        HTMLText("Ctrl")
                    }
                    HTMLText(" + ")
                    KeyboardInput {
                        HTMLText("C")
                    }
                    HTMLText(" to copy.")
                },
                as: .html
            ) {
                """

                <p>Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to copy.
                </p>
                """
            }
        }

        @Test("Kbd for complex key combinations renders correctly")
        func kbdForComplexKeyCombinationsRendersCorrectly() {
            assertInlineSnapshot(
                of: Paragraph {
                    HTMLText("To save the file, use ")
                    KeyboardInput {
                        HTMLText("Ctrl")
                    }
                    HTMLText(" + ")
                    KeyboardInput {
                        HTMLText("Shift")
                    }
                    HTMLText(" + ")
                    KeyboardInput {
                        HTMLText("S")
                    }
                    HTMLText(".")
                },
                as: .html
            ) {
                """

                <p>To save the file, use <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>.
                </p>
                """
            }
        }

        @Test("Kbd for function keys renders correctly")
        func kbdForFunctionKeysRendersCorrectly() {
            assertInlineSnapshot(
                of: UnorderedList {
                    ListItem {
                        KeyboardInput {
                            HTMLText("F1")
                        }
                        HTMLText(" - Help")
                    }
                    ListItem {
                        KeyboardInput {
                            HTMLText("F5")
                        }
                        HTMLText(" - Refresh")
                    }
                    ListItem {
                        KeyboardInput {
                            HTMLText("F12")
                        }
                        HTMLText(" - Developer Tools")
                    }
                },
                as: .html
            ) {
                """

                <ul>
                  <li><kbd>F1</kbd> - Help
                  </li>
                  <li><kbd>F5</kbd> - Refresh
                  </li>
                  <li><kbd>F12</kbd> - Developer Tools
                  </li>
                </ul>
                """
            }
        }

        @Test("Kbd for system commands renders correctly")
        func kbdForSystemCommandsRendersCorrectly() {
            assertInlineSnapshot(
                of: ContentDivision {
                    H3 {
                        HTMLText("Terminal Commands")
                    }
                    Paragraph {
                        HTMLText("Type ")
                        KeyboardInput {
                            HTMLText("ls -la")
                        }
                        HTMLText(" to list all files.")
                    }
                    Paragraph {
                        HTMLText("Use ")
                        KeyboardInput {
                            HTMLText("cd /home/user")
                        }
                        HTMLText(" to change directory.")
                    }
                },
                as: .html
            ) {
                """

                <div>
                  <h3>Terminal Commands
                  </h3>
                  <p>Type <kbd>ls -la</kbd> to list all files.
                  </p>
                  <p>Use <kbd>cd /home/user</kbd> to change directory.
                  </p>
                </div>
                """
            }
        }

        @Test("KeyboardInput within HTMLDocument renders correctly")
        func keyboardInputWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Article {
                        H2 {
                            HTMLText("Keyboard Shortcuts")
                        }
                        Section {
                            H3 {
                                HTMLText("Text Editing")
                            }
                            UnorderedList {
                                ListItem {
                                    KeyboardInput {
                                        HTMLText("Ctrl")
                                    }
                                    HTMLText(" + ")
                                    KeyboardInput {
                                        HTMLText("Z")
                                    }
                                    HTMLText(" - Undo")
                                }
                                ListItem {
                                    KeyboardInput {
                                        HTMLText("Ctrl")
                                    }
                                    HTMLText(" + ")
                                    KeyboardInput {
                                        HTMLText("Y")
                                    }
                                    HTMLText(" - Redo")
                                }
                            }
                        }
                        Section {
                            H3 {
                                HTMLText("Navigation")
                            }
                            Paragraph {
                                HTMLText("Press ")
                                KeyboardInput {
                                    HTMLText("Tab")
                                }
                                HTMLText(" to move to the next field, or ")
                                KeyboardInput {
                                    HTMLText("Shift")
                                }
                                HTMLText(" + ")
                                KeyboardInput {
                                    HTMLText("Tab")
                                }
                                HTMLText(" to move backward.")
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
                  <h2>Keyboard Shortcuts
                  </h2>
                  <section>
                    <h3>Text Editing
                    </h3>
                    <ul>
                      <li><kbd>Ctrl</kbd> + <kbd>Z</kbd> - Undo
                      </li>
                      <li><kbd>Ctrl</kbd> + <kbd>Y</kbd> - Redo
                      </li>
                    </ul>
                  </section>
                  <section>
                    <h3>Navigation
                    </h3>
                    <p>Press <kbd>Tab</kbd> to move to the next field, or <kbd>Shift</kbd> + <kbd>Tab</kbd> to move backward.
                    </p>
                  </section>
                </article>
                  </body>
                </html>
                """
            }
        }
    }
}
