///
/// Height.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 04/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the height attribute on an element
    @discardableResult
    package func height(
        _ value: Height?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Height.attribute, value?.description)
    }
}
