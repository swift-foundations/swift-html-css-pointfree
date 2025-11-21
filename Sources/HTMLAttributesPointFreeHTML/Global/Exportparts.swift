///
/// Exportparts.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the exportparts attribute with part names to export
    @discardableResult
    public func exportparts(
        _ parts: [String]
    ) -> _HTMLAttributes<Self> {
        self.attribute(Exportparts.attribute, parts.joined(separator: ", "))
    }

    /// Sets the exportparts attribute with part names to export as variadic parameters
    @discardableResult
    public func exportparts(
        _ parts: String...
    ) -> _HTMLAttributes<Self> {
        self.exportparts(parts)
    }

    /// Sets the exportparts attribute with explicit part mappings
    @discardableResult
    public func exportparts(
        _ mappings: [Exportparts.PartMapping]
    ) -> _HTMLAttributes<Self> {
        let value = mappings.map { mapping in
            if mapping.originalName == mapping.exposedName {
                return mapping.originalName
            } else {
                return "\(mapping.originalName):\(mapping.exposedName)"
            }
        }.joined(separator: ", ")

        return self.attribute(Exportparts.attribute, value)
    }

    /// Sets the exportparts attribute using an Exportparts struct
    @discardableResult
    public func exportparts(
        _ attribute: Exportparts
    ) -> _HTMLAttributes<Self> {
        self.attribute(Exportparts.attribute, attribute.description)
    }
}
