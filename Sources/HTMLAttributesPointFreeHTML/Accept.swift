///
/// Accept.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Add an accept attribute to specify which file types are allowed
    @discardableResult
    package func accept(
        _ value: Accept?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Accept.attribute, value?.description)
    }

    /// Add an accept attribute with multiple file types
    @discardableResult
    package func accept(
        _ fileTypes: Accept.FileType?...
    ) -> _HTMLAttributes<Self> {
        self.accept(Accept(fileTypes.compactMap { $0 }))
    }

    /// Add an accept attribute with multiple file types
    @discardableResult
    package func accept(
        _ fileTypes: [Accept.FileType?]
    ) -> _HTMLAttributes<Self> {
        self.accept(Accept(fileTypes.compactMap { $0 }))
    }
}
