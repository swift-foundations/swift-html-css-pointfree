///
/// Size.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the size attribute on an element
    @discardableResult
    package func size(
        _ value: Size?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Size.attribute, value?.description)
    }
}
