import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Form Element Tests")
    struct FormTests {
        @Test("Basic form renders correctly")
        func basicFormRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    name: "login",
                    action: .relative("/login"),
                    method: .post
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <form method="post" action="/login" name="login">
                </form>
                """
            }
        }

        @Test("Form with all attributes renders correctly")
        func formWithAllAttributesRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    autocapitalize: .words,
                    autocomplete: .off,
                    name: "registration",
                    rel: "nofollow",
                    action: .absolute("https://example.com/register"),
                    enctype: .multipartFormData,
                    method: .post,
                    novalidate: true,
                    target: .blank
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <form target="_blank" novalidate method="post" enctype="multipart/form-data" action="https://example.com/register" rel="nofollow" name="registration" autocomplete="off" autocapitalize="words">
                </form>
                """
            }
        }

        @Test("Form with content renders correctly")
        func formWithContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    name: "contact",
                    action: .relative("/contact"),
                    method: .post
                ) {
                    ContentDivision {
                        Label(for: "name") {
                            "Name:"
                        }

                        Input.text(
                            name: "name",
                            required: true
                        )()

                        Label(for: "email") {
                            "Email:"
                        }

                        Input.email(
                            name: "email",
                            required: true
                        )()

                        Button {
                            "Submit"
                        }
                    }
                },
                as: .html
            ) {
                """

                <form method="post" action="/contact" name="contact">
                  <div><label for="name">Name:</label><input required type="text" name="name"><label for="email">Email:</label><input required type="email" name="email"><button>Submit</button>
                  </div>
                </form>
                """
            }
        }

        @Test("Form with deprecated accept attribute renders correctly")
        func formWithDeprecatedAcceptAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    name: "upload",
                    action: .relative("/upload"),
                    enctype: .multipartFormData,
                    method: .post
                ) {
                    Input
                        .file(name: "document")()
                }
                .accept(.audio),
                as: .html
            ) {
                """

                <form accept="audio/*" method="post" enctype="multipart/form-data" action="/upload" name="upload"><input type="file" name="document">
                </form>
                """
            }
        }

        @Test("Form with acceptCharset renders correctly")
        func formWithAcceptCharsetRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    name: "international",
                    action: .relative("/submit"),
                    method: .post
                ) {
                    HTMLEmpty()
                }
                .acceptCharset("UTF-8, ISO-8859-1"),
                as: .html
            ) {
                """

                <form accept-charset="UTF-8, ISO-8859-1" method="post" action="/submit" name="international">
                </form>
                """
            }
        }

        @Test("Form with GET method renders correctly")
        func formWithGETMethodRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    name: "search",
                    action: .relative("/search"),
                    method: .get
                ) {
                    Input.search(name: "q")()

                    Button {
                        "Search"
                    }
                    .attribute("type", "submit")
                },
                as: .html
            ) {
                """

                <form method="get" action="/search" name="search"><input type="search" name="q"><button type="submit">Search</button>
                </form>
                """
            }
        }

        @Test("Form with target attribute renders correctly")
        func formWithTargetAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    name: "external",
                    action: .absolute("https://api.example.com/submit"),
                    method: .post,
                    target: .blank
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <form target="_blank" method="post" action="https://api.example.com/submit" name="external">
                </form>
                """
            }
        }

        @Test("Form with autocomplete attribute renders correctly")
        func formWithAutocompleteAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    autocomplete: .off,
                    name: "payment",
                    action: .relative("/payment"),
                    method: .post
                ) {
                    ContentDivision {
                        Input.text(name: "cardNumber")()
                    }
                },
                as: .html
            ) {
                """

                <form method="post" action="/payment" name="payment" autocomplete="off">
                  <div><input type="text" name="cardNumber">
                  </div>
                </form>
                """
            }
        }

        @Test("Form with dialog method renders correctly")
        func formWithDialogMethodRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    method: .dialog
                ) {
                    Button {
                        "Close"
                    }
                },
                as: .html
            ) {
                """

                <form method="dialog"><button>Close</button>
                </form>
                """
            }
        }

        @Test("Form with rel attribute renders correctly")
        func formWithRelAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    name: "external-form",
                    rel: "nofollow noopener",
                    action: .absolute("https://external-service.com/api"),
                    method: .post
                ) {
                    HTMLEmpty()
                },
                as: .html
            ) {
                """

                <form method="post" action="https://external-service.com/api" rel="nofollow noopener" name="external-form">
                </form>
                """
            }
        }

        @Test("Form with custom autocapitalize renders correctly")
        func formWithCustomAutocapitalizeRendersCorrectly() {
            assertInlineSnapshot(
                of: Form(
                    autocapitalize: .characters,
                    name: "capitalize-test"
                ) {
                    Input.text(name: "uppercase")()
                },
                as: .html
            ) {
                """

                <form name="capitalize-test" autocapitalize="characters"><input type="text" name="uppercase">
                </form>
                """
            }
        }
    }
}
