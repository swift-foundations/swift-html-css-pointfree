import HTML_Standard_Elements
import HTMLElementsPointFreeHTML
import InlineSnapshotTesting
import PointFreeHTMLTestSupport
import Testing

extension SnapshotTests {
    @Suite struct MeterTests {
        @Test("Basic meter renders correctly")
        func basicMeterRendersCorrectly() {
            assertInlineSnapshot(
                of: Meter(
                    value: 0.6
                ) {
                    HTMLText("60%")
                },
                as: .html
            ) {
                """

                <meter value="0.6">60%
                </meter>
                """
            }
        }

        @Test("Meter with min and max renders correctly")
        func meterWithMinAndMaxRendersCorrectly() {
            assertInlineSnapshot(
                of: Meter(
                    value: 6,
                    min: 0,
                    max: 10
                ) {
                    HTMLText("6 out of 10")
                },
                as: .html
            ) {
                """

                <meter max="10" min="0" value="6.0">6 out of 10
                </meter>
                """
            }
        }

        @Test("Meter with low and high thresholds renders correctly")
        func meterWithLowAndHighThresholdsRendersCorrectly() {
            assertInlineSnapshot(
                of: Meter(
                    value: 7,
                    min: 0,
                    max: 10,
                    low: 3,
                    high: 8
                ) {
                    HTMLText("7")
                },
                as: .html
            ) {
                """

                <meter high="8.0" low="3.0" max="10" min="0" value="7.0">7
                </meter>
                """
            }
        }

        @Test("Meter with optimum value renders correctly")
        func meterWithOptimumValueRendersCorrectly() {
            assertInlineSnapshot(
                of: Meter(
                    value: 5,
                    min: 0,
                    max: 10,
                    low: 2,
                    high: 8,
                    optimum: 6
                ) {
                    HTMLText("5 (target: 6)")
                },
                as: .html
            ) {
                """

                <meter optimum="6.0" high="8.0" low="2.0" max="10" min="0" value="5.0">5 (target: 6)
                </meter>
                """
            }
        }

        @Test("Meter within HTMLDocument renders correctly")
        func meterWithinHTMLDocumentRendersCorrectly() {
            assertInlineSnapshot(
                of: HTMLDocument {
                    ContentDivision {
                        Meter(
                            value: 0.8,
                            min: 0,
                            max: 1
                        ) {
                            HTMLText("80%")
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
                <div>
                  <meter max="1" min="0" value="0.8">80%
                  </meter>
                </div>
                  </body>
                </html>
                """
            }
        }
    }
}
