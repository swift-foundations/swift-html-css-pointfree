//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import HTMLAttributesPointFreeHTML
import PointFreeHTML

extension HTML_Standard_Elements.Meta: PointFreeHTML.HTML {
    public var body: some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { HTMLEmpty() }
            .charset(self.charset)
            .content(self.content)
            .httpEquiv(self.httpEquiv)
            .media(self.media)
            .name(self.name)
    }
}
