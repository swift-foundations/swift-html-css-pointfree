///
/// Autocorrect.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    @discardableResult
    public func autocorrect(
        _ value: Autocorrect?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Autocorrect.attribute, value?.description)
    }
}
