import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct OptionTests {
        //    @Test("Basic option renders correctly")
        //    func basicOptionRendersCorrectly() {
        //        assertInlineSnapshot(
        //            of: Option {
        //                HTMLText("Default Option")
        //            },
        //            as: .html
        //        ) {
        //            """
        //            <option selected disabled label>Default Option</option>
        //            """
        //        }
        //    }

        @Test("Option with value renders correctly")
        func optionWithValueRendersCorrectly() {
            assertInlineSnapshot(
                of: Option(value: "us") {
                    HTMLText("United States")
                },
                as: .html
            ) {
                """

                <option value="us">United States
                </option>
                """
            }
        }

        @Test("Option with selected attribute renders correctly")
        func optionWithSelectedAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Option(
                    selected: true,
                    value: "default"
                ) {
                    HTMLText("Default Selection")
                },
                as: .html
            ) {
                """

                <option value="default" selected>Default Selection
                </option>
                """
            }
        }

        @Test("Option with disabled attribute renders correctly")
        func optionWithDisabledAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Option(
                    disabled: true,
                    value: "unavailable"
                ) {
                    HTMLText("Unavailable Option")
                },
                as: .html
            ) {
                """

                <option value="unavailable" disabled>Unavailable Option
                </option>
                """
            }
        }

        @Test("Option with label attribute renders correctly")
        func optionWithLabelAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Option(
                    label: "New York State",
                    value: "ny"
                ) {
                    HTMLText("NY")
                },
                as: .html
            ) {
                """

                <option value="ny" label="New York State">NY
                </option>
                """
            }
        }

        @Test("Option with all attributes renders correctly")
        func optionWithAllAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Option(
                    disabled: false,
                    label: "Premium Plan - Best Value",
                    selected: true,
                    value: "premium"
                ) {
                    HTMLText("Premium ($19.99/month)")
                },
                as: .html
            ) {
                """

                <option value="premium" selected label="Premium Plan - Best Value">Premium ($19.99/month)
                </option>
                """
            }
        }

        @Test("Options in select context render correctly")
        func optionsInSelectContextRenderCorrectly() {
            assertInlineSnapshot(
                of: Select(name: "country") {
                    Option(value: "") {
                        HTMLText("Select a country")
                    }
                    Option(
                        selected: true,
                        value: "us"
                    ) {
                        HTMLText("United States")
                    }
                    Option(value: "uk") {
                        HTMLText("United Kingdom")
                    }
                    Option(
                        disabled: true,
                        value: "fr"
                    ) {
                        HTMLText("France (Unavailable)")
                    }
                },
                as: .html
            ) {
                """
                <select name="country">
                <option value>Select a country
                </option>
                <option value="us" selected>United States
                </option>
                <option value="uk">United Kingdom
                </option>
                <option value="fr" disabled>France (Unavailable)
                </option></select>
                """
            }
        }

        @Test("Option within HTMLDocument renders correctly")
        func optionWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Form {
                        H2 {
                            HTMLText("Event Registration")
                        }
                        FieldSet {
                            Legend {
                                HTMLText("Event Selection")
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Choose an event: ")
                                    Select(
                                        name: "event",
                                        required: true
                                    ) {
                                        Option(value: "") {
                                            HTMLText("Please select an event")
                                        }
                                        Option(
                                            label: "JavaScript Workshop - Beginner Level",
                                            value: "workshop-js"
                                        ) {
                                            HTMLText("JS Workshop (Beginner)")
                                        }
                                        Option(
                                            label:
                                                "Swift Development Workshop - Intermediate Level",
                                            value: "workshop-swift"
                                        ) {
                                            HTMLText("Swift Workshop (Intermediate)")
                                        }
                                        Option(
                                            label: "Annual Tech Conference - All Levels",
                                            value: "conference"
                                        ) {
                                            HTMLText("Tech Conference")
                                        }
                                        Option(
                                            disabled: true,
                                            label: "Web Development Webinar - Sold Out",
                                            value: "webinar"
                                        ) {
                                            HTMLText("Webinar (Sold Out)")
                                        }
                                    }
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Session Time: ")
                                    Select(name: "session") {
                                        Option(
                                            selected: true,
                                            value: "morning"
                                        ) {
                                            HTMLText("Morning Session (9:00 AM)")
                                        }
                                        Option(value: "afternoon") {
                                            HTMLText("Afternoon Session (2:00 PM)")
                                        }
                                        Option(value: "evening") {
                                            HTMLText("Evening Session (6:00 PM)")
                                        }
                                    }
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Experience Level: ")
                                    Select(name: "level") {
                                        OptionGroup(label: "Programming Experience") {
                                            Option(value: "beginner") {
                                                HTMLText("Beginner (0-1 years)")
                                            }
                                            Option(
                                                selected: true,
                                                value: "intermediate"
                                            ) {
                                                HTMLText("Intermediate (2-5 years)")
                                            }
                                            Option(value: "advanced") {
                                                HTMLText("Advanced (5+ years)")
                                            }
                                        }
                                        OptionGroup(label: "Other") {
                                            Option(value: "student") {
                                                HTMLText("Student")
                                            }
                                            Option(value: "educator") {
                                                HTMLText("Educator/Teacher")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Paragraph {
                            Button(type: .submit) {
                                HTMLText("Register")
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
                <form>
                  <h2>Event Registration
                  </h2>
                  <fieldset>
                    <legend>Event Selection
                    </legend>
                    <p><label>Choose an event: <select required name="event">
                      <option value>Please select an event
                      </option>
                      <option value="workshop-js" label="JavaScript Workshop - Beginner Level">JS Workshop (Beginner)
                      </option>
                      <option value="workshop-swift" label="Swift Development Workshop - Intermediate Level">Swift Workshop (Intermediate)
                      </option>
                      <option value="conference" label="Annual Tech Conference - All Levels">Tech Conference
                      </option>
                      <option value="webinar" label="Web Development Webinar - Sold Out" disabled>Webinar (Sold Out)
                      </option></select></label>
                    </p>
                    <p><label>Session Time: <select name="session">
                      <option value="morning" selected>Morning Session (9:00 AM)
                      </option>
                      <option value="afternoon">Afternoon Session (2:00 PM)
                      </option>
                      <option value="evening">Evening Session (6:00 PM)
                      </option></select></label>
                    </p>
                    <p><label>Experience Level: <select name="level">
                      <optgroup label="Programming Experience">
                        <option value="beginner">Beginner (0-1 years)
                        </option>
                        <option value="intermediate" selected>Intermediate (2-5 years)
                        </option>
                        <option value="advanced">Advanced (5+ years)
                        </option>
                      </optgroup>
                      <optgroup label="Other">
                        <option value="student">Student
                        </option>
                        <option value="educator">Educator/Teacher
                        </option>
                      </optgroup></select></label>
                    </p>
                  </fieldset>
                  <p><button type="submit">Register</button>
                  </p>
                </form>
                  </body>
                </html>
                """
            }
        }
    }
}
