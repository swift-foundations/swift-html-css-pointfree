import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Select Element Tests")
    struct SelectTests {
        @Test("Basic select renders correctly")
        func basicSelectRendersCorrectly() {
            assertInlineSnapshot(
                of: Select {
                    Option(value: "option1") {
                        HTMLText("Option 1")
                    }
                    Option(value: "option2") {
                        HTMLText("Option 2")
                    }
                },
                as: .html
            ) {
                """
                <select>
                <option value="option1">Option 1
                </option>
                <option value="option2">Option 2
                </option></select>
                """
            }
        }

        @Test("Select with name renders correctly")
        func selectWithNameRendersCorrectly() {
            assertInlineSnapshot(
                of: Select(name: "country") {
                    Option(value: "") {
                        HTMLText("Please select a country")
                    }
                    Option(value: "us") {
                        HTMLText("United States")
                    }
                    Option(value: "uk") {
                        HTMLText("United Kingdom")
                    }
                    Option(value: "ca") {
                        HTMLText("Canada")
                    }
                },
                as: .html
            ) {
                """
                <select name="country">
                <option value>Please select a country
                </option>
                <option value="us">United States
                </option>
                <option value="uk">United Kingdom
                </option>
                <option value="ca">Canada
                </option></select>
                """
            }
        }

        @Test("Select with multiple attribute renders correctly")
        func selectWithMultipleAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Select(
                    multiple: true,
                    name: "skills",
                    size: 4
                ) {
                    Option(value: "html") {
                        HTMLText("HTML")
                    }
                    Option(value: "css") {
                        HTMLText("CSS")
                    }
                    Option(value: "javascript") {
                        HTMLText("JavaScript")
                    }
                    Option(value: "swift") {
                        HTMLText("Swift")
                    }
                },
                as: .html
            ) {
                """
                <select size="4" name="skills" multiple>
                <option value="html">HTML
                </option>
                <option value="css">CSS
                </option>
                <option value="javascript">JavaScript
                </option>
                <option value="swift">Swift
                </option></select>
                """
            }
        }

        @Test("Select with required and disabled attributes renders correctly")
        func selectWithRequiredAndDisabledAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Select(
                    name: "status",
                    required: true,
                    disabled: true
                ) {
                    Option(value: "active") {
                        HTMLText("Active")
                    }
                    Option(value: "inactive") {
                        HTMLText("Inactive")
                    }
                },
                as: .html
            ) {
                """
                <select disabled required name="status">
                <option value="active">Active
                </option>
                <option value="inactive">Inactive
                </option></select>
                """
            }
        }

        @Test("Select with optgroups renders correctly")
        func selectWithOptgroupsRendersCorrectly() {
            assertInlineSnapshot(
                of: Select(name: "food") {
                    OptionGroup(label: "Fruits") {
                        Option(value: "apple") {
                            HTMLText("Apple")
                        }
                        Option(value: "banana") {
                            HTMLText("Banana")
                        }
                        Option(value: "orange") {
                            HTMLText("Orange")
                        }
                    }
                    OptionGroup(label: "Vegetables") {
                        Option(value: "carrot") {
                            HTMLText("Carrot")
                        }
                        Option(value: "broccoli") {
                            HTMLText("Broccoli")
                        }
                    }
                },
                as: .html
            ) {
                """
                <select name="food">
                <optgroup label="Fruits">
                  <option value="apple">Apple
                  </option>
                  <option value="banana">Banana
                  </option>
                  <option value="orange">Orange
                  </option>
                </optgroup>
                <optgroup label="Vegetables">
                  <option value="carrot">Carrot
                  </option>
                  <option value="broccoli">Broccoli
                  </option>
                </optgroup></select>
                """
            }
        }

        @Test("Select with form association renders correctly")
        func selectWithFormAssociationRendersCorrectly() {
            assertInlineSnapshot(
                of: Select(
                    name: "priority",
                    form: "task-form",
                    autofocus: true
                ) {
                    Option(value: "low") {
                        HTMLText("Low Priority")
                    }
                    Option(value: "medium") {
                        HTMLText("Medium Priority")
                    }
                    Option(value: "high") {
                        HTMLText("High Priority")
                    }
                },
                as: .html
            ) {
                """
                <select autofocus form="task-form" name="priority">
                <option value="low">Low Priority
                </option>
                <option value="medium">Medium Priority
                </option>
                <option value="high">High Priority
                </option></select>
                """
            }
        }

        @Test("Select within HTMLDocument renders correctly")
        func selectWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Form(method: .post) {
                        H2 {
                            HTMLText("User Preferences")
                        }
                        FieldSet {
                            Legend {
                                HTMLText("Display Settings")
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Theme: ")
                                    Select(
                                        name: "theme",
                                        required: true
                                    ) {
                                        Option(value: "") {
                                            HTMLText("Choose a theme")
                                        }
                                        Option(value: "light") {
                                            HTMLText("Light Theme")
                                        }
                                        Option(value: "dark") {
                                            HTMLText("Dark Theme")
                                        }
                                        Option(value: "auto") {
                                            HTMLText("Auto (System)")
                                        }
                                    }
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Language: ")
                                    Select(name: "language") {
                                        OptionGroup(label: "European Languages") {
                                            Option(value: "en") {
                                                HTMLText("English")
                                            }
                                            Option(value: "fr") {
                                                HTMLText("Français")
                                            }
                                            Option(value: "de") {
                                                HTMLText("Deutsch")
                                            }
                                            Option(value: "es") {
                                                HTMLText("Español")
                                            }
                                        }
                                        OptionGroup(label: "Asian Languages") {
                                            Option(value: "zh") {
                                                HTMLText("中文")
                                            }
                                            Option(value: "ja") {
                                                HTMLText("日本語")
                                            }
                                            Option(value: "ko") {
                                                HTMLText("한국어")
                                            }
                                        }
                                    }
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Interests (multiple selection): ")
                                    //                                BR()
                                    Select(
                                        multiple: true,
                                        name: "interests",
                                        size: 6
                                    ) {
                                        Option(value: "technology") {
                                            HTMLText("Technology")
                                        }
                                        Option(value: "science") {
                                            HTMLText("Science")
                                        }
                                        Option(value: "arts") {
                                            HTMLText("Arts & Culture")
                                        }
                                        Option(value: "sports") {
                                            HTMLText("Sports")
                                        }
                                        Option(value: "travel") {
                                            HTMLText("Travel")
                                        }
                                        Option(value: "cooking") {
                                            HTMLText("Cooking")
                                        }
                                    }
                                }
                            }
                        }
                        Paragraph {
                            Button(type: .submit) {
                                HTMLText("Save Preferences")
                            }
                            HTMLText(" ")
                            Button(type: .reset) {
                                HTMLText("Reset")
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
                <form method="post">
                  <h2>User Preferences
                  </h2>
                  <fieldset>
                    <legend>Display Settings
                    </legend>
                    <p><label>Theme: <select required name="theme">
                      <option value>Choose a theme
                      </option>
                      <option value="light">Light Theme
                      </option>
                      <option value="dark">Dark Theme
                      </option>
                      <option value="auto">Auto (System)
                      </option></select></label>
                    </p>
                    <p><label>Language: <select name="language">
                      <optgroup label="European Languages">
                        <option value="en">English
                        </option>
                        <option value="fr">Français
                        </option>
                        <option value="de">Deutsch
                        </option>
                        <option value="es">Español
                        </option>
                      </optgroup>
                      <optgroup label="Asian Languages">
                        <option value="zh">中文
                        </option>
                        <option value="ja">日本語
                        </option>
                        <option value="ko">한국어
                        </option>
                      </optgroup></select></label>
                    </p>
                    <p><label>Interests (multiple selection): <select size="6" name="interests" multiple>
                      <option value="technology">Technology
                      </option>
                      <option value="science">Science
                      </option>
                      <option value="arts">Arts &amp; Culture
                      </option>
                      <option value="sports">Sports
                      </option>
                      <option value="travel">Travel
                      </option>
                      <option value="cooking">Cooking
                      </option></select></label>
                    </p>
                  </fieldset>
                  <p><button type="submit">Save Preferences</button> <button type="reset">Reset</button>
                  </p>
                </form>
                  </body>
                </html>
                """
            }
        }
    }
}
