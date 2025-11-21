//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import HTMLAttributesPointFreeHTML

extension HTML_Standard_Elements.Frame {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .src(self.src)
            .name(self.name)
            .noResize(self.noresize)
            .scrolling(self.scrolling)
            .marginHeight(self.marginheight)
            .marginWidth(self.marginwidth)
            .frameBorder(self.frameborder)
    }
}
