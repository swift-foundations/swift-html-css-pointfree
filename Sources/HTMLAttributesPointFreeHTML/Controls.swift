//
//  Controls.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the controls attribute on an element
    @discardableResult
    package func controls(
        _ value: Controls?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
