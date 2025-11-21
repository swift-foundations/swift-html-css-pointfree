import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct OptionGroupTests {
        @Test("Basic optgroup renders correctly")
        func basicOptgroupRendersCorrectly() {
            assertInlineSnapshot(
                of: OptionGroup {
                    Option(value: "item1") {
                        HTMLText("Item 1")
                    }
                    Option(value: "item2") {
                        HTMLText("Item 2")
                    }
                },
                as: .html
            ) {
                """

                <optgroup>
                  <option value="item1">Item 1
                  </option>
                  <option value="item2">Item 2
                  </option>
                </optgroup>
                """
            }
        }

        @Test("Optgroup with label renders correctly")
        func optgroupWithLabelRendersCorrectly() {
            assertInlineSnapshot(
                of: OptionGroup(label: "Fruits") {
                    Option(value: "apple") {
                        HTMLText("Apple")
                    }
                    Option(value: "banana") {
                        HTMLText("Banana")
                    }
                    Option(value: "orange") {
                        HTMLText("Orange")
                    }
                },
                as: .html
            ) {
                """

                <optgroup label="Fruits">
                  <option value="apple">Apple
                  </option>
                  <option value="banana">Banana
                  </option>
                  <option value="orange">Orange
                  </option>
                </optgroup>
                """
            }
        }

        @Test("Optgroup with disabled attribute renders correctly")
        func optgroupWithDisabledAttributeRendersCorrectly() {
            assertInlineSnapshot(
                of: OptionGroup(
                    disabled: true,
                    label: "Unavailable Items"
                ) {
                    Option(value: "out-of-stock-1") {
                        HTMLText("Out of Stock Item 1")
                    }
                    Option(value: "out-of-stock-2") {
                        HTMLText("Out of Stock Item 2")
                    }
                },
                as: .html
            ) {
                """

                <optgroup label="Unavailable Items" disabled>
                  <option value="out-of-stock-1">Out of Stock Item 1
                  </option>
                  <option value="out-of-stock-2">Out of Stock Item 2
                  </option>
                </optgroup>
                """
            }
        }

        @Test("Multiple optgroups render correctly")
        func multipleOptgroupsRenderCorrectly() {
            assertInlineSnapshot(
                of: Select(name: "food-categories") {
                    OptionGroup(label: "Fruits") {
                        Option(value: "apple") {
                            HTMLText("Apple")
                        }
                        Option(value: "banana") {
                            HTMLText("Banana")
                        }
                    }
                    OptionGroup(label: "Vegetables") {
                        Option(value: "carrot") {
                            HTMLText("Carrot")
                        }
                        Option(value: "spinach") {
                            HTMLText("Spinach")
                        }
                    }
                    OptionGroup(
                        disabled: true,
                        label: "Dairy"
                    ) {
                        Option(value: "milk") {
                            HTMLText("Milk")
                        }
                        Option(value: "cheese") {
                            HTMLText("Cheese")
                        }
                    }
                },
                as: .html
            ) {
                """
                <select name="food-categories">
                <optgroup label="Fruits">
                  <option value="apple">Apple
                  </option>
                  <option value="banana">Banana
                  </option>
                </optgroup>
                <optgroup label="Vegetables">
                  <option value="carrot">Carrot
                  </option>
                  <option value="spinach">Spinach
                  </option>
                </optgroup>
                <optgroup label="Dairy" disabled>
                  <option value="milk">Milk
                  </option>
                  <option value="cheese">Cheese
                  </option>
                </optgroup></select>
                """
            }
        }

        @Test("Optgroup with complex options renders correctly")
        func optgroupWithComplexOptionsRendersCorrectly() {
            assertInlineSnapshot(
                of: OptionGroup(label: "Software Licenses") {
                    Option(
                        selected: true,
                        value: "basic"
                    ) {
                        HTMLText("Basic License ($10/month)")
                    }
                    Option(
                        label: "Professional License - Full Features",
                        value: "pro"
                    ) {
                        HTMLText("Pro License ($25/month)")
                    }
                    Option(
                        disabled: true,
                        label: "Enterprise License - Contact Sales",
                        value: "enterprise"
                    ) {
                        HTMLText("Enterprise (Contact Us)")
                    }
                },
                as: .html
            ) {
                """

                <optgroup label="Software Licenses">
                  <option value="basic" selected>Basic License ($10/month)
                  </option>
                  <option value="pro" label="Professional License - Full Features">Pro License ($25/month)
                  </option>
                  <option value="enterprise" label="Enterprise License - Contact Sales" disabled>Enterprise (Contact Us)
                  </option>
                </optgroup>
                """
            }
        }

        @Test("OptionGroup within HTMLDocument renders correctly")
        func optionGroupWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    Form {
                        H2 {
                            HTMLText("Travel Booking")
                        }
                        FieldSet {
                            Legend {
                                HTMLText("Destination Selection")
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Choose your destination: ")
                                    Select(
                                        name: "destination",
                                        required: true
                                    ) {
                                        Option(value: "") {
                                            HTMLText("Select a destination")
                                        }
                                        OptionGroup(label: "Europe") {
                                            Option(value: "paris") {
                                                HTMLText("Paris, France")
                                            }
                                            Option(value: "london") {
                                                HTMLText("London, UK")
                                            }
                                            Option(value: "rome") {
                                                HTMLText("Rome, Italy")
                                            }
                                            Option(value: "barcelona") {
                                                HTMLText("Barcelona, Spain")
                                            }
                                        }
                                        OptionGroup(label: "Asia") {
                                            Option(value: "tokyo") {
                                                HTMLText("Tokyo, Japan")
                                            }
                                            Option(value: "seoul") {
                                                HTMLText("Seoul, South Korea")
                                            }
                                            Option(value: "beijing") {
                                                HTMLText("Beijing, China")
                                            }
                                        }
                                        OptionGroup(
                                            disabled: false,
                                            label: "Americas"
                                        ) {
                                            Option(value: "nyc") {
                                                HTMLText("New York City, USA")
                                            }
                                            Option(
                                                selected: true,
                                                value: "toronto"
                                            ) {
                                                HTMLText("Toronto, Canada")
                                            }
                                            Option(value: "mexico-city") {
                                                HTMLText("Mexico City, Mexico")
                                            }
                                        }
                                        OptionGroup(
                                            disabled: true,
                                            label: "Oceania"
                                        ) {
                                            Option(value: "sydney") {
                                                HTMLText("Sydney, Australia (Unavailable)")
                                            }
                                            Option(value: "auckland") {
                                                HTMLText("Auckland, New Zealand (Unavailable)")
                                            }
                                        }
                                    }
                                }
                            }
                            Paragraph {
                                Label {
                                    HTMLText("Travel class: ")
                                    Select(name: "class") {
                                        OptionGroup(label: "Standard Options") {
                                            Option(
                                                selected: true,
                                                value: "economy"
                                            ) {
                                                HTMLText("Economy Class")
                                            }
                                            Option(value: "premium-economy") {
                                                HTMLText("Premium Economy")
                                            }
                                        }
                                        OptionGroup(label: "Premium Options") {
                                            Option(value: "business") {
                                                HTMLText("Business Class")
                                            }
                                            Option(value: "first") {
                                                HTMLText("First Class")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Paragraph {
                            Button(type: .submit) {
                                HTMLText("Search Flights")
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
                  <h2>Travel Booking
                  </h2>
                  <fieldset>
                    <legend>Destination Selection
                    </legend>
                    <p><label>Choose your destination: <select required name="destination">
                      <option value>Select a destination
                      </option>
                      <optgroup label="Europe">
                        <option value="paris">Paris, France
                        </option>
                        <option value="london">London, UK
                        </option>
                        <option value="rome">Rome, Italy
                        </option>
                        <option value="barcelona">Barcelona, Spain
                        </option>
                      </optgroup>
                      <optgroup label="Asia">
                        <option value="tokyo">Tokyo, Japan
                        </option>
                        <option value="seoul">Seoul, South Korea
                        </option>
                        <option value="beijing">Beijing, China
                        </option>
                      </optgroup>
                      <optgroup label="Americas">
                        <option value="nyc">New York City, USA
                        </option>
                        <option value="toronto" selected>Toronto, Canada
                        </option>
                        <option value="mexico-city">Mexico City, Mexico
                        </option>
                      </optgroup>
                      <optgroup label="Oceania" disabled>
                        <option value="sydney">Sydney, Australia (Unavailable)
                        </option>
                        <option value="auckland">Auckland, New Zealand (Unavailable)
                        </option>
                      </optgroup></select></label>
                    </p>
                    <p><label>Travel class: <select name="class">
                      <optgroup label="Standard Options">
                        <option value="economy" selected>Economy Class
                        </option>
                        <option value="premium-economy">Premium Economy
                        </option>
                      </optgroup>
                      <optgroup label="Premium Options">
                        <option value="business">Business Class
                        </option>
                        <option value="first">First Class
                        </option>
                      </optgroup></select></label>
                    </p>
                  </fieldset>
                  <p><button type="submit">Search Flights</button>
                  </p>
                </form>
                  </body>
                </html>
                """
            }
        }
    }
}
