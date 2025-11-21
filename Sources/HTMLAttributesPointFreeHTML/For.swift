///
/// For.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the for attribute on an element
    @discardableResult
    package func `for`(
        _ value: For?
    ) -> _HTMLAttributes<Self> {
        self.attribute(For.attribute, value?.description)
    }
}
