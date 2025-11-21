//
//  Cols.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the cols attribute on an element
    @discardableResult
    package func cols(
        _ value: Cols?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Cols.attribute, value?.description)
    }
}
