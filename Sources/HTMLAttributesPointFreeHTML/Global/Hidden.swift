///
/// Hidden.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the hidden attribute with a specific value
    @discardableResult
    public func hidden(
        _ hidden: Hidden
    ) -> _HTMLAttributes<Self> {
        self.attribute(Hidden.attribute)
    }

    /// Sets the hidden attribute without a value (equivalent to hidden="")
    @discardableResult
    public func hidden() -> _HTMLAttributes<Self> {
        self.attribute(Hidden.attribute)
    }
}
