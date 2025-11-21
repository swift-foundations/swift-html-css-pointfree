//
//  AttributionSrc.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the attributionsrc attribute on an element
    @discardableResult
    package func attributionSrc(
        _ value: AttributionSrc?
    ) -> _HTMLAttributes<Self> {
        self.attribute(AttributionSrc.attribute, value?.description)
    }
}
