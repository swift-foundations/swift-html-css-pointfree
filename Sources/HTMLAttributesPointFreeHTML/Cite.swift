//
//  Cite.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the cite attribute on an element
    @discardableResult
    package func cite(
        _ value: Cite?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Cite.attribute, value?.description)
    }
}
