//
//  Color.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the color attribute on an element
    @discardableResult
    package func color(
        _ value: Color?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Color.attribute, value?.description)
    }
}
