//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements
import PointFreeHTML

extension HTML_Standard_Elements.Source: PointFreeHTML.HTML {
    public var body: some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { HTMLEmpty() }
            .type(self.type)
            .src(self.src)
            .srcset(self.srcset)
            .sizes(self.sizes)
            .media(self.media)
            .height(self.height)
            .width(self.width)
    }
}
