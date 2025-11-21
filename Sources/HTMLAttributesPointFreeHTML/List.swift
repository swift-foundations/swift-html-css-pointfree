///
/// List.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 04/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the list attribute on an element
    @discardableResult
    package func list(
        _ value: List?
    ) -> _HTMLAttributes<Self> {
        self.attribute(List.attribute, value?.description)
    }
}
