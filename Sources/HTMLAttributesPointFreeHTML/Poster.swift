//
//  Poster.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the poster attribute on an element
    @discardableResult
    package func poster(
        _ value: Poster?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Poster.attribute, value?.description)
    }
}
