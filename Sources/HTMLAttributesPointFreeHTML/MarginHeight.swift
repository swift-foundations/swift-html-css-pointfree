///
/// MarginHeight.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the maxlength attribute on an element
    @discardableResult
    package func marginHeight(
        _ value: MarginHeight?
    ) -> _HTMLAttributes<Self> {
        self.attribute(MarginHeight.attribute, value?.description)
    }
}
