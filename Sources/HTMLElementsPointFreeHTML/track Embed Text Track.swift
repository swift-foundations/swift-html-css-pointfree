//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements
import PointFreeHTML

extension HTML_Standard_Elements.Track: PointFreeHTML.HTML {
    public var body: some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { HTMLEmpty() }
            .default(self.default)
            .kind(self.kind)
            .label(self.label)
            .src(self.src)
            .srcLang(self.srclang)
    }
}
