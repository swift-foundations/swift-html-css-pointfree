///
/// MarginWidth.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the maxlength attribute on an element
    @discardableResult
    package func marginWidth(
        _ value: MarginWidth?
    ) -> _HTMLAttributes<Self> {
        self.attribute(MarginWidth.attribute, value?.description)
    }
}
