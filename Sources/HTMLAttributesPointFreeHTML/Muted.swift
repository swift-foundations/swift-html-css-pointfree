//
//  Muted.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the muted attribute on an element
    @discardableResult
    package func muted(
        _ value: Muted?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
