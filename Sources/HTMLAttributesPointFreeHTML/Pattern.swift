///
/// Pattern.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the pattern attribute on an element
    @discardableResult
    package func pattern(
        _ value: Pattern?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Pattern.attribute, value?.description)
    }
}
