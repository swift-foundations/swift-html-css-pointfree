///
/// DataAttribute.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    @discardableResult
    public func data(
        _ name: some CustomStringConvertible,
        _ value: some CustomStringConvertible
    ) -> _HTMLAttributes<Self> {
        let attribute = DataAttribute(name: name, value: value)
        return self.attribute(attribute.attributeName, attribute.description)
    }

    @discardableResult
    public func data(
        _ value: DataAttribute?
    ) -> _HTMLAttributes<Self> {
        self.attribute(value?.attributeName ?? "", value?.description)
    }
}
