//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTML_Standard_Elements
import PointFreeHTML

extension HTML_Standard_Elements.LineBreakOpportunity: @retroactive PointFreeHTML.HTML {
    public var body: PointFreeHTML.HTMLElement<HTMLEmpty> {
        PointFreeHTML.HTMLElement(tag: Self.tag) { PointFreeHTML.HTMLEmpty() }
    }
}
