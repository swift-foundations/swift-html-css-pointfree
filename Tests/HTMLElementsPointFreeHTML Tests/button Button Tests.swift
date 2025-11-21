import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Button Element Tests")
    struct ButtonTests {
        @Test("Basic button renders correctly")
        func basicButtonRendersCorrectly() {
            assertInlineSnapshot(
                of: Button {
                    HTMLText("Click Me")
                },
                as: .html
            ) {
                """
                <button>Click Me</button>
                """
            }
        }

        @Test("Button with type submit renders correctly")
        func buttonWithTypeSubmitRendersCorrectly() {
            assertInlineSnapshot(
                of: Button(
                    type: .submit
                ) {
                    HTMLText("Submit Form")
                },
                as: .html
            ) {
                """
                <button type="submit">Submit Form</button>
                """
            }
        }

        @Test("Button with disabled attribute renders correctly")
        func buttonWithDisabledAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Button(
                    disabled: true
                ) {
                    HTMLText("Disabled Button")
                },
                as: .html
            ) {
                """
                <button disabled>Disabled Button</button>
                """
            }
        }

        @Test("Button with name and value renders correctly")
        func buttonWithNameAndValueRendersCorrectly() {
            assertInlineSnapshot(
                of: Button(
                    name: "action",
                    value: "delete"
                ) {
                    HTMLText("Delete Item")
                },
                as: .html
            ) {
                """
                <button value="delete" name="action">Delete Item</button>
                """
            }
        }

        @Test("Button with form attributes renders correctly")
        func buttonWithFormAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Button(
                    type: .submit,
                    form: "myform",
                    formaction: "/alternative-submit",
                    formmethod: .post
                ) {
                    HTMLText("Alternative Submit")
                },
                as: .html
            ) {
                """
                <button formmethod="post" formaction="/alternative-submit" form="myform" type="submit">Alternative Submit</button>
                """
            }
        }

        @Test("Button with nested content renders correctly")
        func buttonWithNestedContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Button {
                    StrongImportance {
                        HTMLText("Bold")
                    }
                    HTMLText(" Button Text")
                },
                as: .html
            ) {
                """
                <button><strong>Bold</strong> Button Text</button>
                """
            }
        }

        @Test(
            "Button within HTMLDocument renders correctly",
            .disabled("Doesn't compile when Input is uncommented")
        )
        func buttonWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Form(action: "/submit", method: .post) {
                        ContentDivision {
                            Label(for: "email") {
                                HTMLText("Email:")
                            }
                            //                        Input(
                            //                            name: "email",
                            //                            type: .email(.init(value: ""))
                            //                        )
                        }
                        ContentDivision {
                            Button(
                                type: .submit
                            ) {
                                HTMLText("Submit")
                            }
                            Button(
                                type: .reset
                            ) {
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
                <form method="post" action="/submit">
                  <div><label for="email">Email:</label>
                  </div>
                  <div><button type="submit">Submit</button><button type="reset">Reset</button>
                  </div>
                </form>
                  </body>
                </html>
                """
            }
        }
    }
}
