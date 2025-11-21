///
/// Capture.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    @discardableResult
    package func capture(
        _ value: Capture?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Capture.attribute, value?.description)
    }
}
