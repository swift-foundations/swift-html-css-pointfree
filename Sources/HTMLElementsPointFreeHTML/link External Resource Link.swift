//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import HTMLAttributesPointFreeHTML
import PointFreeHTML

extension HTML_Standard_Elements.Link: PointFreeHTML.HTML {
    public var body: some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { HTMLEmpty() }
            .`as`(self.`as`)
            .blocking(self.blocking)
            .crossorigin(self.crossorigin)
            .disabled(self.disabled)
            .fetchPriority(self.fetchpriority)
            .href(self.href)
            .hreflang(self.hreflang)
            .sizes(self.imagesizes)
            .srcset(self.imagesrcset)
            .integrity(self.integrity)
            .media(self.media)
            .referrerPolicy(self.referrerpolicy)
            .rel(self.rel)
            .sizes(self.sizes)
            .title(self.title)
            .type(self.type)
    }
}
