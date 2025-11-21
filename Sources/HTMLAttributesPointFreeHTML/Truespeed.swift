//
//  File 2.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Adds the truespeed attribute to the element
    package var truespeed: _HTMLAttributes<Self> {
        self.attribute(Truespeed.attribute)
    }

    /// Conditionally adds the truespeed attribute to the element
    @HTMLBuilder
    package func truespeed(
        _ value: Truespeed?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
