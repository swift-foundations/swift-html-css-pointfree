//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import HTMLAttributesPointFreeHTML

extension HTML_Standard_Elements.Form {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .accept(self.accept)
            .acceptCharset(self.acceptCharset)
            .autocapitalize(self.autocapitalize)
            .autocomplete(self.autocomplete)
            .name(self.name)
            .rel(self.rel)
            .action(self.action)
            .EncType(self.enctype)
            .method(self.method)
            .novalidate(self.novalidate)
            .target(self.target)
    }
}
