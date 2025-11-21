import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct LegendTests {
        @Test("Basic legend renders correctly")
        func basicLegendRendersCorrectly() {
            assertInlineSnapshot(
                of: Legend {
                    HTMLText("Personal Information")
                },
                as: .html
            ) {
                """

                <legend>Personal Information
                </legend>
                """
            }
        }

        @Test("Legend with formatting renders correctly")
        func legendWithFormattingRendersCorrectly() {
            assertInlineSnapshot(
                of: Legend {
                    StrongImportance {
                        HTMLText("Required")
                    }
                    HTMLText(" Contact Details")
                },
                as: .html
            ) {
                """

                <legend><strong>Required</strong> Contact Details
                </legend>
                """
            }
        }

        @Test("Legend with icon renders correctly")
        func legendWithIconRendersCorrectly() {
            assertInlineSnapshot(
                of: Legend {
                    ContentSpan {
                        HTMLText("👤")
                    }
                    HTMLText(" User Profile")
                },
                as: .html
            ) {
                """

                <legend><span>👤</span> User Profile
                </legend>
                """
            }
        }

        @Test("Legend in fieldset context renders correctly")
        func legendInFieldsetContextRendersCorrectly() {
            assertInlineSnapshot(
                of: FieldSet {
                    Legend {
                        HTMLText("Shipping Address")
                    }
                    Paragraph {
                        Label {
                            HTMLText("Street: ")
                            Input(
                                name: "street",
                                type: .text(.init())
                            )
                        }
                    }
                    Paragraph {
                        Label {
                            HTMLText("City: ")
                            Input(
                                name: "city",
                                type: .text(.init())
                            )
                        }
                    }
                },
                as: .html
            ) {
                """

                <fieldset>
                  <legend>Shipping Address
                  </legend>
                  <p><label>Street: <input type="text" name="street"></label>
                  </p>
                  <p><label>City: <input type="text" name="city"></label>
                  </p>
                </fieldset>
                """
            }
        }

        @Test("Legend with complex content renders correctly")
        func legendWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Legend {
                    ContentSpan {
                        HTMLText("Section 1:")
                    }
                    HTMLText(" ")
                    Emphasis {
                        HTMLText("Personal Details")
                    }
                    HTMLText(" (")
                    Small {
                        HTMLText("All fields required")
                    }
                    HTMLText(")")
                },
                as: .html
            ) {
                """

                <legend><span>Section 1:</span> <em>Personal Details</em> (<small>All fields required</small>)
                </legend>
                """
            }
        }

        @Test("Legend with styling classes renders correctly")
        func legendWithStylingClassesRendersCorrectly() {
            assertInlineSnapshot(
                of: Legend {
                    StrongImportance {
                        HTMLText("Payment Information")
                    }
                },
                as: .html
            ) {
                """

                <legend><strong>Payment Information</strong>
                </legend>
                """
            }
        }

        @Test("Legend within HTMLDocument renders correctly")
        func legendWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Form(method: .post) {
                        H1 {
                            HTMLText("Customer Survey")
                        }
                        FieldSet {
                            Legend {
                                StrongImportance {
                                    HTMLText("Step 1:")
                                }
                                HTMLText(" Personal Information")
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Full Name: ")
                                    Input(
                                        name: "fullName",
                                        type: .text(.init())
                                    )
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Age Group: ")
                                    Select(name: "ageGroup") {
                                        Option(value: "18-25") {
                                            HTMLText("18-25")
                                        }
                                        Option(value: "26-35") {
                                            HTMLText("26-35")
                                        }
                                        Option(value: "36-50") {
                                            HTMLText("36-50")
                                        }
                                    }
                                }
                            }
                        }
                        FieldSet {
                            Legend {
                                StrongImportance {
                                    HTMLText("Step 2:")
                                }
                                HTMLText(" Feedback & Ratings")
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Overall Satisfaction: ")
                                    //                                BR()
                                    Input(
                                        name: "satisfaction",
                                        type: .radio(.init())
                                    )
                                    HTMLText(" Excellent ")
                                    Input(
                                        name: "satisfaction",
                                        type: .radio(.init())
                                    )
                                    HTMLText(" Good ")
                                    Input(
                                        name: "satisfaction",
                                        type: .radio(.init())
                                    )
                                    HTMLText(" Average")
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Comments: ")
                                    //                                BR()
                                    Textarea(
                                        cols: 50,
                                        name: "comments",
                                        placeholder: "Please share your thoughts...",
                                        rows: 4
                                    ) {}
                                }
                            }
                        }
                        Paragraph {
                            Button(type: .submit) {
                                HTMLText("Submit Survey")
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
                  <h1>Customer Survey
                  </h1>
                  <fieldset>
                    <legend><strong>Step 1:</strong> Personal Information
                    </legend>
                    <p><label>Full Name: <input type="text" name="fullName"></label>
                    </p>
                    <p><label>Age Group: <select name="ageGroup">
                      <option value="18-25">18-25
                      </option>
                      <option value="26-35">26-35
                      </option>
                      <option value="36-50">36-50
                      </option></select></label>
                    </p>
                  </fieldset>
                  <fieldset>
                    <legend><strong>Step 2:</strong> Feedback &amp; Ratings
                    </legend>
                    <p><label>Overall Satisfaction: <input type="radio" name="satisfaction"> Excellent <input type="radio" name="satisfaction"> Good <input type="radio" name="satisfaction"> Average</label>
                    </p>
                    <p><label>Comments: <textarea rows="4" placeholder="Please share your thoughts..." name="comments" cols="50"></textarea></label>
                    </p>
                  </fieldset>
                  <p><button type="submit">Submit Survey</button>
                  </p>
                </form>
                  </body>
                </html>
                """
            }
        }
    }
}
