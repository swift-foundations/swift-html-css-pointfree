//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import HTMLAttributesPointFreeHTML
import PointFreeHTML

extension HTML_Standard_Elements.Option: PointFreeHTML.HTML {
    public var body: some HTML {
        HTMLElement(tag: Self.tag)
            .disabled(self.disabled)
            .label(self.label)
            .selected(self.selected)
            .value(self.value)
    }

    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .disabled(self.disabled)
            .label(self.label)
            .selected(self.selected)
            .value(self.value)
    }
}
