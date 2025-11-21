///
/// Dirname.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    @discardableResult
    package func dirname(
        _ value: Dirname?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Dirname.attribute, value?.description)
    }
}
