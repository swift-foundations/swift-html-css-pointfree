//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements

extension HTML_Standard_Elements.Base {
    @HTMLBuilder
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        let element = HTMLElement(tag: Self.tag) { content() }
        switch self.configuration {
        case .href(let href):
            element.href(href)
        case .target(let target):
            element.target(target)
        case .both(let href, let target):
            element
                .href(href)
                .target(target)
        }
    }
}
