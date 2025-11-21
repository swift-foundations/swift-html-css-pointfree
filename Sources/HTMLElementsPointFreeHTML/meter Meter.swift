//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements

extension HTML_Standard_Elements.Meter {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .value(self.value)
            .min(self.min)
            .max(self.max)
            .low(self.low)
            .high(self.high)
            .optimum(self.optimum)
            .form(self.form)
    }
}
