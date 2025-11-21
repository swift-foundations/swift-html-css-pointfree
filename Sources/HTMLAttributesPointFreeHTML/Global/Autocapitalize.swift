///
/// Autocapitalize.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    @discardableResult
    public func autocapitalize(
        _ value: Autocapitalize?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Autocapitalize.attribute, value?.description)
    }
}
