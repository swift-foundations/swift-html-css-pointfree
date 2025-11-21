//
//  ReadmeVerificationTests.swift
//  swift-html-css-pointfree
//
//  Created for README verification
//

import HTMLCSSPointFreeHTML
import CSSPointFreeHTML
import CSS_Standard
import PointFreeHTML
import Testing

@Suite("README Verification")
struct ReadmeVerificationTests {

    @Test("Quick Start example from README line 62-75")
    func quickStartExample() throws {
        let document = HTMLDocument {
            ContentDivision {
                "Hello World"
            }
            .color(.red)
            .backgroundColor(.hex("F0F0F0"))
        }

        let html = String(bytes: document.render(), encoding: .utf8)!

        #expect(html.contains("Hello World"))
        #expect(html.contains("color:red"))
        #expect(html.contains("background-color:#F0F0F0"))
    }

    @Test("Applying CSS Properties example from README line 81-91")
    func applyingCSSProperties() throws {
        // Apply color with type safety
        let styledDiv = ContentDivision {
            "Styled content"
        }
        .color(.blue)
        .fontSize(.px(16))
        .padding(.rem(1))

        let document = HTMLDocument { styledDiv }
        let html = String(bytes: document.render(), encoding: .utf8)!

        #expect(html.contains("Styled content"))
        #expect(html.contains("color:blue"))
        #expect(html.contains("font-size:16px"))
        #expect(html.contains("padding:1rem"))
    }

    @Test("Media Queries example from README line 95-103")
    func mediaQueries() throws {
        // Responsive styling
        let responsiveDiv = ContentDivision {
            "Responsive content"
        }
        .padding(.rem(1), media: .mobile)
        .padding(.rem(2), media: .tablet)
        .padding(.rem(3), media: .desktop)

        let document = HTMLDocument { responsiveDiv }
        let html = String(bytes: document.render(), encoding: .utf8)!

        #expect(html.contains("Responsive content"))
        #expect(html.contains("@media"))
        #expect(html.contains("padding:1rem"))
        #expect(html.contains("padding:2rem"))
        #expect(html.contains("padding:3rem"))
    }

    @Test("Pseudo-Classes example from README line 107-114")
    func pseudoClasses() throws {
        // Interactive styling
        let interactiveLink = Anchor(href: "/path") {
            "Hover me"
        }
        .color(.blue)
        .color(.red, pseudo: .hover)

        let document = HTMLDocument { interactiveLink }
        let html = String(bytes: document.render(), encoding: .utf8)!

        #expect(html.contains("Hover me"))
        #expect(html.contains("href=\"/path\""))
        #expect(html.contains("color:blue"))
        #expect(html.contains(":hover"))
        #expect(html.contains("color:red"))
    }

    @Test("Multiple Properties example from README line 118-129")
    func multipleProperties() throws {
        let complexElement = ContentDivision {
            Paragraph {
                "Complex styling"
            }
            .color(.named(.darkblue))
            .fontSize(.px(18))
        }
        .backgroundColor(.hex("FFFFFF"))
        .padding(.rem(2))
        .margin(.px(10))

        let document = HTMLDocument { complexElement }
        let html = String(bytes: document.render(), encoding: .utf8)!

        #expect(html.contains("Complex styling"))
        #expect(html.contains("color:darkblue"))
        #expect(html.contains("font-size:18px"))
        #expect(html.contains("background-color:#FFFFFF"))
        #expect(html.contains("padding:2rem"))
        #expect(html.contains("margin:10px"))
    }
}
