//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import HTMLAttributesPointFreeHTML
import HTML_Standard_Elements

extension HTML_Standard_Elements.Marquee {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
            .behavior(self.behavior)
            //            .bgcolor(self.bgcolor)
            .attribute("bgcolor", self.bgcolor)
            .direction(self.direction)
            .height(self.height)
            .attribute("hspace", self.hspace)
            .loop(self.loop)
            .attribute("scrollamount", self.scrollamount)
            .attribute("scrolldelay", self.scrolldelay)
            .attribute(boolean: self.truespeed)
            .attribute("vspace", self.vspace)
            .width(self.width)
    }
}
