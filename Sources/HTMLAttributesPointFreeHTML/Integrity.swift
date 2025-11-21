//
//  Integrity.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the integrity attribute on an element
    @discardableResult
    package func integrity(
        _ value: Integrity?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Integrity.attribute, value?.description)
    }
}
