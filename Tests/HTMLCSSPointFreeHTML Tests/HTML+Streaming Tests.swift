//
//  HTML+Streaming Tests.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 25/11/2025.
//

import HTMLCSSPointFreeHTML
import PointFreeHTML
import Testing

@Suite("HTML+Streaming Tests")
struct HTMLStreamingTests {

    // MARK: - Custom HTML Components with var body

    @Test("Custom struct with body streams correctly")
    func customStructStreaming() throws {
        struct Greeting: HTML {
            let name: String

            var body: some HTML {
                Paragraph {
                    HTMLText("Hello, \(name)!")
                }
            }
        }

        let html = Greeting(name: "World")

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("Hello, World!"))
    }

    @Test("Custom card component streams correctly")
    func customCardStreaming() throws {
        struct Card: HTML {
            let title: String
            let content: String

            var body: some HTML {
                ContentDivision {
                    H2 { HTMLText(title) }
                    Paragraph { HTMLText(content) }
                }
                .attribute("class", "card")
            }
        }

        let html = Card(title: "My Card", content: "This is the card content.")

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("My Card"))
        #expect(streamingOutput.contains("card content"))
    }

    // MARK: - Nested Custom Components

    @Test("Nested custom components stream correctly")
    func nestedComponentsStreaming() throws {
        struct Badge: HTML {
            let text: String

            var body: some HTML {
                ContentSpan { HTMLText(text) }
                    .attribute("class", "badge")
            }
        }

        struct UserProfile: HTML {
            let name: String
            let role: String

            var body: some HTML {
                ContentDivision {
                    H3 { HTMLText(name) }
                    Badge(text: role)
                }
                .attribute("class", "user-profile")
            }
        }

        let html = UserProfile(name: "Alice", role: "Admin")

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("Alice"))
        #expect(streamingOutput.contains("Admin"))
        #expect(streamingOutput.contains("badge"))
    }

    @Test("Deeply nested components stream correctly")
    func deeplyNestedStreaming() throws {
        struct Icon: HTML {
            let name: String

            var body: some HTML {
                ContentSpan { HTMLText("[\(name)]") }
                    .attribute("class", "icon")
            }
        }

        struct Button: HTML {
            let label: String
            let icon: String?

            var body: some HTML {
                HTMLElement(tag: "button") {
                    if let icon {
                        Icon(name: icon)
                    }
                    HTMLText(label)
                }
                .attribute("class", "btn")
            }
        }

        struct Toolbar: HTML {
            var body: some HTML {
                ContentDivision {
                    Button(label: "Save", icon: "save")
                    Button(label: "Cancel", icon: nil)
                    Button(label: "Delete", icon: "trash")
                }
                .attribute("class", "toolbar")
            }
        }

        let html = Toolbar()

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("Save"))
        #expect(streamingOutput.contains("Cancel"))
        #expect(streamingOutput.contains("Delete"))
    }

    // MARK: - Components with HTML Elements

    @Test("Component with Anchor element streams correctly")
    func anchorComponentStreaming() throws {
        struct NavLink: HTML {
            let href: String
            let label: String

            var body: some HTML {
                Anchor(href: .init(href)) {
                    HTMLText(label)
                }
            }
        }

        let html = NavLink(href: "/home", label: "Home")

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("href=\"/home\""))
        #expect(streamingOutput.contains("Home"))
    }

    @Test("Navigation component with multiple links streams correctly")
    func navigationStreaming() throws {
        struct NavItem: HTML {
            let href: String
            let label: String

            var body: some HTML {
                ListItem {
                    Anchor(href: .init(href)) {
                        HTMLText(label)
                    }
                }
            }
        }

        struct Navigation: HTML {
            let items: [(href: String, label: String)]

            var body: some HTML {
                NavigationSection {
                    UnorderedList {
                        for item in items {
                            NavItem(href: item.href, label: item.label)
                        }
                    }
                }
            }
        }

        let html = Navigation(items: [
            (href: "/", label: "Home"),
            (href: "/about", label: "About"),
            (href: "/contact", label: "Contact")
        ])

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("<nav>"))
        #expect(streamingOutput.contains("Home"))
        #expect(streamingOutput.contains("About"))
        #expect(streamingOutput.contains("Contact"))
    }

    // MARK: - Components with CSS Styling

    @Test("Component with inline style streams correctly")
    func styledComponentStreaming() throws {
        struct StyledCard: HTML {
            let title: String

            var body: some HTML {
                ContentDivision {
                    H2 { HTMLText(title) }
                        .inlineStyle("color", "blue")
                }
                .inlineStyle("padding", "20px")
                .inlineStyle("border", "1px solid #ccc")
            }
        }

        let html = StyledCard(title: "Styled Card")

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("Styled Card"))
    }

    @Test("Component with color styling streams correctly")
    func colorStyledComponentStreaming() throws {
        struct ColoredText: HTML {
            let text: String

            var body: some HTML {
                Paragraph { HTMLText(text) }
                    .color(.red)
            }
        }

        let html = ColoredText(text: "This is red text")

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("This is red text"))
    }

    // MARK: - Complex Page Layout

    @Test("Complex page layout streams correctly")
    func pageLayoutStreaming() throws {
        struct PageHeader: HTML {
            let title: String

            var body: some HTML {
                Header {
                    H1 { HTMLText(title) }
                }
            }
        }

        struct PageFooter: HTML {
            let copyright: String

            var body: some HTML {
                Footer {
                    Paragraph { HTMLText(copyright) }
                }
            }
        }

        struct PageLayout: HTML {
            let title: String
            let content: String

            var body: some HTML {
                ContentDivision {
                    PageHeader(title: title)
                    Main {
                        Article {
                            Paragraph { HTMLText(content) }
                        }
                    }
                    PageFooter(copyright: "© 2025")
                }
                .attribute("class", "page")
            }
        }

        let html = PageLayout(title: "Welcome", content: "Main content here")

        let printerOutput = try String(html)
        let streamingOutput = String(decoding: html.bytes, as: UTF8.self)

        #expect(printerOutput == streamingOutput)
        #expect(streamingOutput.contains("<header>"))
        #expect(streamingOutput.contains("Welcome"))
        #expect(streamingOutput.contains("<main>"))
        #expect(streamingOutput.contains("Main content here"))
        #expect(streamingOutput.contains("<footer>"))
        #expect(streamingOutput.contains("© 2025"))
    }

    // MARK: - Streaming to Different Buffer Types

    @Test("Custom component streams to ContiguousArray")
    func contiguousArrayStreaming() {
        struct SimpleComponent: HTML {
            var body: some HTML {
                ContentDivision {
                    HTMLText("Hello from ContiguousArray")
                }
            }
        }

        let html = SimpleComponent()
        var buffer = ContiguousArray<UInt8>()
        html.serialize(into: &buffer)

        let result = String(decoding: Array(buffer), as: UTF8.self)
        #expect(result.contains("Hello from ContiguousArray"))
    }

    @Test("Custom component streams with pre-allocated buffer")
    func preAllocatedBufferStreaming() {
        struct LargeComponent: HTML {
            var body: some HTML {
                ContentDivision {
                    HTMLForEach(1...10) { i in
                        Paragraph { HTMLText("Item \(i)") }
                    }
                }
            }
        }

        let html = LargeComponent()
        var buffer: [UInt8] = []
        buffer.reserveCapacity(10000)
        html.serialize(into: &buffer)

        let result = String(decoding: buffer, as: UTF8.self)
        #expect(result.contains("Item 1"))
        #expect(result.contains("Item 10"))
    }

    // MARK: - Conditional Content in Custom Components

    @Test("Component with conditional content streams correctly")
    func conditionalContentStreaming() throws {
        struct ConditionalCard: HTML {
            let showHeader: Bool
            let content: String

            var body: some HTML {
                ContentDivision {
                    if showHeader {
                        H2 { HTMLText("Header") }
                    }
                    Paragraph { HTMLText(content) }
                }
            }
        }

        let withHeader = ConditionalCard(showHeader: true, content: "With header")
        let withoutHeader = ConditionalCard(showHeader: false, content: "Without header")

        // With header
        let printerOutput1 = try String(withHeader)
        let streamingOutput1 = String(decoding: withHeader.bytes, as: UTF8.self)
        #expect(printerOutput1 == streamingOutput1)
        #expect(streamingOutput1.contains("<h2>"))

        // Without header
        let printerOutput2 = try String(withoutHeader)
        let streamingOutput2 = String(decoding: withoutHeader.bytes, as: UTF8.self)
        #expect(printerOutput2 == streamingOutput2)
        #expect(!streamingOutput2.contains("<h2>"))
    }

    @Test("Component with optional content streams correctly")
    func optionalContentStreaming() throws {
        struct OptionalSubtitle: HTML {
            let title: String
            let subtitle: String?

            var body: some HTML {
                ContentDivision {
                    H1 { HTMLText(title) }
                    if let subtitle {
                        H2 { HTMLText(subtitle) }
                    }
                }
            }
        }

        let withSubtitle = OptionalSubtitle(title: "Title", subtitle: "Subtitle")
        let withoutSubtitle = OptionalSubtitle(title: "Title Only", subtitle: nil)

        let printerOutput1 = try String(withSubtitle)
        let streamingOutput1 = String(decoding: withSubtitle.bytes, as: UTF8.self)
        #expect(printerOutput1 == streamingOutput1)

        let printerOutput2 = try String(withoutSubtitle)
        let streamingOutput2 = String(decoding: withoutSubtitle.bytes, as: UTF8.self)
        #expect(printerOutput2 == streamingOutput2)
    }
}
