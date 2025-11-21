import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite("Data Element Tests")
    struct DataTests {
        @Test("Basic data element renders correctly")
        func basicDataElementRendersCorrectly() {
            assertInlineSnapshot(
                of: Data(
                    value: .init("12345")
                ) {
                    HTMLText("Product ID: ABC-123")
                },
                as: .html
            ) {
                """

                <data value="12345">Product ID: ABC-123
                </data>
                """
            }
        }

        @Test("Data element with numeric value renders correctly")
        func dataElementWithNumericValueRendersCorrectly() {
            assertInlineSnapshot(
                of: Data(
                    value: .init("299.99")
                ) {
                    HTMLText("$299.99")
                },
                as: .html
            ) {
                """

                <data value="299.99">$299.99
                </data>
                """
            }
        }

        @Test("Data element with URL value renders correctly")
        func dataElementWithURLValueRendersCorrectly() {
            assertInlineSnapshot(
                of: Data(
                    value: .init("https://example.com/product/123")
                ) {
                    HTMLText("Premium Widget")
                },
                as: .html
            ) {
                """

                <data value="https://example.com/product/123">Premium Widget
                </data>
                """
            }
        }

        @Test("Data element within list renders correctly")
        func dataElementWithinListRendersCorrectly() {
            assertInlineSnapshot(
                of: UnorderedList {
                    ListItem {
                        Data(
                            value: .init("PROD001")
                        ) {
                            HTMLText("Wireless Headphones")
                        }
                    }
                    ListItem {
                        Data(
                            value: .init("PROD002")
                        ) {
                            HTMLText("Bluetooth Speaker")
                        }
                    }
                },
                as: .html
            ) {
                """

                <ul>
                  <li>
                    <data value="PROD001">Wireless Headphones
                    </data>
                  </li>
                  <li>
                    <data value="PROD002">Bluetooth Speaker
                    </data>
                  </li>
                </ul>
                """
            }
        }

        @Test("Data element with complex content renders correctly")
        func dataElementWithComplexContentRendersCorrectly() {
            assertInlineSnapshot(
                of: Data(
                    value: .init("2024-Q1-SALES")
                ) {
                    StrongImportance {
                        HTMLText("Q1 2024 Sales Report")
                    }
                    HTMLText(" - Performance Summary")
                },
                as: .html
            ) {
                """

                <data value="2024-Q1-SALES"><strong>Q1 2024 Sales Report</strong> - Performance Summary
                </data>
                """
            }
        }

        @Test("Data element in table context renders correctly")
        func dataElementInTableContextRendersCorrectly() {
            assertInlineSnapshot(
                of: Table {
                    TableBody {
                        TableRow {
                            TableDataCell {
                                HTMLText("Product")
                            }
                            TableDataCell {
                                HTMLText("Price")
                            }
                        }
                        TableRow {
                            TableDataCell {
                                Data(
                                    value: .init("LAPTOP001")
                                ) {
                                    HTMLText("Gaming Laptop")
                                }
                            }
                            TableDataCell {
                                Data(
                                    value: .init("1299.99")
                                ) {
                                    HTMLText("$1,299.99")
                                }
                            }
                        }
                    }
                },
                as: .html
            ) {
                """

                <table>
                  <tbody>
                    <tr>
                      <td>Product
                      </td>
                      <td>Price
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <data value="LAPTOP001">Gaming Laptop
                        </data>
                      </td>
                      <td>
                        <data value="1299.99">$1,299.99
                        </data>
                      </td>
                    </tr>
                  </tbody>
                </table>
                """
            }
        }

        @Test("Data element within HTMLDocument renders correctly")
        func dataElementWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        HTMLText("Item: ")
                        Data(
                            value: .init("SKU-789")
                        ) {
                            HTMLText("Premium Coffee Maker")
                        }
                        HTMLText(" is now available.")
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
                <div>Item:
                  <data value="SKU-789">Premium Coffee Maker
                  </data> is now available.
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
