///
/// Step.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the step attribute on an element
    @discardableResult
    package func step(
        _ value: Step?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Step.attribute, value?.description)
    }
}
