//
//  Autoplay.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the autoplay attribute on an element
    @discardableResult
    package func autoplay(
        _ value: Autoplay?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
