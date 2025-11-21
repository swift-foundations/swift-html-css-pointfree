import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("FieldSet Element Tests")
    struct FieldSetTests {
        @Test("Basic fieldset renders correctly")
        func basicFieldsetRendersCorrectly() {
            assertInlineSnapshot(
                of: FieldSet {
                    Legend {
                        HTMLText("Personal Information")
                    }
                    Label {
                        HTMLText("Name: ")
                        Input(
                            name: "name",
                            type: .text(.init())
                        )
                    }
                },
                as: .html
            ) {
                """

                <fieldset>
                  <legend>Personal Information
                  </legend><label>Name: <input type="text" name="name"></label>
                </fieldset>
                """
            }
        }

        @Test("Fieldset with name renders correctly")
        func fieldsetWithNameRendersCorrectly() {
            assertInlineSnapshot(
                of: FieldSet(
                    name: "user-details"
                ) {
                    Legend {
                        HTMLText("User Details")
                    }
                    Paragraph {
                        Label {
                            HTMLText("Email: ")
                            Input(
                                name: "email",
                                type: .email(.init())
                            )
                        }
                    }
                },
                as: .html
            ) {
                """

                <fieldset name="user-details">
                  <legend>User Details
                  </legend>
                  <p><label>Email: <input type="email" name="email"></label>
                  </p>
                </fieldset>
                """
            }
        }

        @Test("Fieldset with disabled attribute renders correctly")
        func fieldsetWithDisabledAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: FieldSet(
                    disabled: true
                ) {
                    Legend {
                        HTMLText("Disabled Section")
                    }
                    Label {
                        HTMLText("Username: ")
                        Input(
                            name: "username",
                            type: .text(.init())
                        )
                    }
                    Label {
                        HTMLText("Password: ")
                        Input(
                            name: "password",
                            type: .password(.init())
                        )
                    }
                },
                as: .html
            ) {
                """

                <fieldset disabled>
                  <legend>Disabled Section
                  </legend><label>Username: <input type="text" name="username"></label><label>Password: <input type="password" name="password"></label>
                </fieldset>
                """
            }
        }

        @Test("Fieldset with form association renders correctly")
        func fieldsetWithFormAssociationRendersCorrectly() {
            assertInlineSnapshot(
                of: FieldSet(
                    form: "contact-form",
                    name: "contact-info"
                ) {
                    Legend {
                        HTMLText("Contact Information")
                    }
                    Paragraph {
                        Label {
                            HTMLText("Phone: ")
                            Input(
                                name: "phone",
                                type: .tel(.init())
                            )
                        }
                    }
                    Paragraph {
                        Label {
                            HTMLText("Address: ")
                            Textarea(name: "address") {
                                HTMLText("Enter your address")
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <fieldset name="contact-info" form="contact-form">
                  <legend>Contact Information
                  </legend>
                  <p><label>Phone: <input type="tel" name="phone"></label>
                  </p>
                  <p><label>Address: <textarea name="address">Enter your address</textarea></label>
                  </p>
                </fieldset>
                """
            }
        }

        @Test("Nested fieldsets render correctly")
        func nestedFieldsetsRenderCorrectly() {
            assertInlineSnapshot(
                of: FieldSet(
                    name: "shipping"
                ) {
                    Legend {
                        HTMLText("Shipping Information")
                    }
                    FieldSet(
                        name: "billing-address"
                    ) {
                        Legend {
                            HTMLText("Billing Address")
                        }
                        Label {
                            HTMLText("Street: ")
                            Input(
                                name: "billing-street",
                                type: .text(.init())
                            )
                        }
                    }
                    FieldSet(
                        name: "shipping-address"
                    ) {
                        Legend {
                            HTMLText("Shipping Address")
                        }
                        Label {
                            HTMLText("Street: ")
                            Input(
                                name: "shipping-street",
                                type: .text(.init())
                            )
                        }
                    }
                },
                as: .html
            ) {
                """

                <fieldset name="shipping">
                  <legend>Shipping Information
                  </legend>
                  <fieldset name="billing-address">
                    <legend>Billing Address
                    </legend><label>Street: <input type="text" name="billing-street"></label>
                  </fieldset>
                  <fieldset name="shipping-address">
                    <legend>Shipping Address
                    </legend><label>Street: <input type="text" name="shipping-street"></label>
                  </fieldset>
                </fieldset>
                """
            }
        }

        @Test("FieldSet within HTMLDocument renders correctly")
        func fieldSetWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Form(action: "/register", method: .post) {
                        H2 {
                            HTMLText("User Registration")
                        }
                        FieldSet(
                            name: "personal-info"
                        ) {
                            Legend {
                                HTMLText("Personal Information")
                            }
                            Paragraph {
                                Label {
                                    HTMLText("First Name: ")
                                    Input(
                                        name: "firstName",
                                        type: .text(.init())
                                    )
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Last Name: ")
                                    Input(
                                        name: "lastName",
                                        type: .text(.init())
                                    )
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Email: ")
                                    Input(
                                        name: "email",
                                        type: .email(.init())
                                    )
                                }
                            }
                        }
                        FieldSet(
                            name: "preferences"
                        ) {
                            Legend {
                                HTMLText("Preferences")
                            }
                            Paragraph {
                                Label {
                                    Input(
                                        name: "newsletter",
                                        type: .checkbox(.init())
                                    )
                                    HTMLText(" Subscribe to newsletter")
                                }
                            }
                            Paragraph {
                                Label {
                                    Input(
                                        name: "notifications",
                                        type: .checkbox(.init())
                                    )
                                    HTMLText(" Receive notifications")
                                }
                            }
                        }
                        Paragraph {
                            Button(
                                type: .submit
                            ) {
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
                <form method="post" action="/register">
                  <h2>User Registration
                  </h2>
                  <fieldset name="personal-info">
                    <legend>Personal Information
                    </legend>
                    <p><label>First Name: <input type="text" name="firstName"></label>
                    </p>
                    <p><label>Last Name: <input type="text" name="lastName"></label>
                    </p>
                    <p><label>Email: <input type="email" name="email"></label>
                    </p>
                  </fieldset>
                  <fieldset name="preferences">
                    <legend>Preferences
                    </legend>
                    <p><label><input type="checkbox" name="newsletter"> Subscribe to newsletter</label>
                    </p>
                    <p><label><input type="checkbox" name="notifications"> Receive notifications</label>
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
