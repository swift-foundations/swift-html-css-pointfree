//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements
import PointFreeHTML

extension HTML_Standard_Elements.Param: PointFreeHTML.HTML {
    public var body: some PointFreeHTML.HTML {
        PointFreeHTML.HTMLElement(tag: Self.tag) { PointFreeHTML.HTMLEmpty() }
            .name(self.name)
            .value(self.value)
    }
}
