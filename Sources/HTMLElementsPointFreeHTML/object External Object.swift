//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import HTMLAttributesPointFreeHTML

extension HTML_Standard_Elements.ExternalObject {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .data(self.data)
            .type(self.type)
            .form(self.form)
            .name(self.name)
            .height(self.height)
            .width(self.width)
            .usemap(self.usemap)
    }
}
