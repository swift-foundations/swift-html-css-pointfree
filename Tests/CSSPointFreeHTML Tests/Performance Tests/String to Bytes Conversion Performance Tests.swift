//
//  String to Bytes Conversion Performance Tests.swift
//  swift-html-css-pointfree
//
//  Performance tests focused on measuring String → Bytes (UTF-8) conversion overhead.
//  Tests the fundamental cost of the two-stage conversion: Type → String → Bytes.
//

import CSSPointFreeHTML
import CSS_Standard
import PointFreeHTML
import PointFreeHTMLTestSupport
import Testing
import TestingPerformance

extension `Performance Tests` {
    @Suite
    struct `String to Bytes Conversion` {

        // MARK: - Type → String Conversion Cost (.description)

        @Test(.timed(threshold: .seconds(2)))
        func `type to string - Color.description 10K times`() {
            let color = W3C_CSS_Values.Color.rgb(255, 128, 64)
            for _ in 0..<10_000 {
                _ = color.description
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `type to string - Length.description 10K times`() {
            let length = W3C_CSS_Values.Length.px(100)
            for _ in 0..<10_000 {
                _ = length.description
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `type to string - complex Color.description 10K times`() {
            let color = W3C_CSS_Values.Color.rgba(200, 150, 100, 0.75)
            for _ in 0..<10_000 {
                _ = color.description
            }
        }

        // MARK: - String → Bytes Conversion Cost (UTF-8)

        @Test(.timed(threshold: .seconds(2)))
        func `string to bytes - simple string UTF-8 10K times`() {
            let str = "rgb(255, 128, 64)"
            for _ in 0..<10_000 {
                _ = Array(str.utf8)
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `string to bytes - complex string UTF-8 10K times`() {
            let str = "rgba(200, 150, 100, 0.75)"
            for _ in 0..<10_000 {
                _ = Array(str.utf8)
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `string to bytes - CSS property string UTF-8 10K times`() {
            let str = "background-color: rgb(255, 0, 0);"
            for _ in 0..<10_000 {
                _ = Array(str.utf8)
            }
        }

        // MARK: - Full Conversion Chain: Type → String → Bytes

        @Test(.timed(threshold: .seconds(2)))
        func `full chain - Color → String → Bytes 5K times`() {
            let color = W3C_CSS_Values.Color.rgb(255, 128, 64)
            for _ in 0..<5_000 {
                let str = color.description
                _ = Array(str.utf8)
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `full chain - Length → String → Bytes 5K times`() {
            let length = W3C_CSS_Values.Length.px(200)
            for _ in 0..<5_000 {
                let str = length.description
                _ = Array(str.utf8)
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `full chain - BackgroundColor property → String → Bytes 5K times`() {
            let prop = BackgroundColor.color(.rgb(100, 200, 150))
            for _ in 0..<5_000 {
                let str = prop.description
                _ = Array(str.utf8)
            }
        }

        // MARK: - Accumulated Conversion Cost (Multiple Properties)

        @Test(.timed(threshold: .seconds(2)))
        func `accumulated - 5 properties converted 2K times`() {
            let bgColor = BackgroundColor.color(.rgb(255, 255, 255))
            let width = Width.length(.px(200))
            let height = Height.length(.px(100))
            let color = Color.color(.hex(.init(0x333333)))
            let padding = Padding.length(.px(16))

            for _ in 0..<2_000 {
                _ = Array(bgColor.description.utf8)
                _ = Array(width.description.utf8)
                _ = Array(height.description.utf8)
                _ = Array(color.description.utf8)
                _ = Array(padding.description.utf8)
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `accumulated - 8 properties converted 1K times`() {
            let properties: [any CustomStringConvertible] = [
                BackgroundColor.color(.rgb(255, 255, 255)),
                Width.length(.px(400)),
                Height.length(.px(300)),
                PaddingTop.length(.px(20)),
                PaddingRight.length(.px(20)),
                PaddingBottom.length(.px(20)),
                PaddingLeft.length(.px(20)),
                Color.color(.named(.black)),
            ]

            for _ in 0..<1_000 {
                for prop in properties {
                    _ = Array(prop.description.utf8)
                }
            }
        }

        // MARK: - Comparison: Direct Bytes vs String Path

        @Test(.timed(threshold: .seconds(2)))
        func `comparison - direct bytes RGB 10K times`() {
            // Simulating what a hypothetical byte-based renderer would do
            for _ in 0..<10_000 {
                var bytes: [UInt8] = []
                bytes.append(contentsOf: [114, 103, 98, 40]) // "rgb("
                bytes.append(contentsOf: "255".utf8)
                bytes.append(contentsOf: [44, 32]) // ", "
                bytes.append(contentsOf: "128".utf8)
                bytes.append(contentsOf: [44, 32]) // ", "
                bytes.append(contentsOf: "64".utf8)
                bytes.append(41) // ")"
                _ = bytes
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `comparison - string path RGB 10K times`() {
            // Current approach: String interpolation → UTF-8
            for _ in 0..<10_000 {
                let str = "rgb(255, 128, 64)"
                _ = Array(str.utf8)
            }
        }

        // MARK: - Memory Allocation Overhead

        @Test(.timed(threshold: .seconds(2)))
        func `allocation - String creation 10K times`() {
            for i in 0..<10_000 {
                _ = "rgb(\(i % 256), 128, 64)"
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `allocation - String → Bytes array 10K times`() {
            for i in 0..<10_000 {
                let str = "rgb(\(i % 256), 128, 64)"
                _ = Array(str.utf8)
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `allocation - ContiguousArray bytes 10K times`() {
            for i in 0..<10_000 {
                var bytes = ContiguousArray<UInt8>()
                bytes.append(contentsOf: "rgb(".utf8)
                bytes.append(contentsOf: String(i % 256).utf8)
                bytes.append(contentsOf: ", 128, 64)".utf8)
                _ = bytes
            }
        }

        // MARK: - Escaping Overhead

        @Test(.timed(threshold: .seconds(2)))
        func `escaping - attribute value no escaping 5K times`() {
            let value = "simple-value-123"
            for _ in 0..<5_000 {
                _ = try! String(
                    HTMLDocument {
                        tag("div").attribute("data-value", value)
                    }
                )
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `escaping - attribute value with quotes 5K times`() {
            let value = "He said \"Hello\" and 'goodbye'"
            for _ in 0..<5_000 {
                _ = try! String(
                    HTMLDocument {
                        tag("div").attribute("data-value", value)
                    }
                )
            }
        }

        // MARK: - Cache Locality Tests

        @Test(.timed(threshold: .seconds(2)))
        func `cache - same property reused 10K times`() {
            let prop = BackgroundColor.color(.rgb(255, 0, 0))
            for _ in 0..<10_000 {
                _ = Array(prop.description.utf8)
            }
        }

        @Test(.timed(threshold: .seconds(2)))
        func `cache - different properties each iteration 5K times`() {
            for i in 0..<5_000 {
                let prop = BackgroundColor.color(.rgb(
                    (i * 23) % 256,
                    (i * 47) % 256,
                    (i * 71) % 256
                ))
                _ = Array(prop.description.utf8)
            }
        }
    }
}
