///
/// Action.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Add an action attribute to specify the URL for form submission
    @discardableResult
    public func action(
        _ value: Action?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Action.attribute, value?.description)
    }
}

// extension HTML {
//    /// Add an action attribute with a URL object
//    @discardableResult
//    public func action(
//        _ url: URL
//    ) -> _HTMLAttributes<Self> {
//        self.action(.init(url))
//    }
// }
