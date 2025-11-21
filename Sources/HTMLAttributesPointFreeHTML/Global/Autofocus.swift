///
/// Autofocus.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    public var autofocus: _HTMLAttributes<Self> {
        self.attribute(Autofocus.attribute)
    }
}

extension HTML {
    @discardableResult
    public func autofocus(
        _ value: Autofocus?
    ) -> some PointFreeHTML.HTML {
        self.attribute(boolean: value)
    }
}
