///
/// Class.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    @discardableResult
    public func `class`(
        _ value: Class?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Class.attribute, value?.description)
    }
}

// extension HTML {
//    @discardableResult
//    public func `class`(
//        _ value: [Class?]
//    ) -> _HTMLAttributes<Self> {
//        self.attribute(Class.attribute, Class(value.compactMap{ $0 }.map(\.description)).description)
//    }
//
//    @discardableResult
//    public func `class`(
//        _ value: Class?...
//    ) -> _HTMLAttributes<Self> {
//        self.attribute(Class.attribute, Class(value.compactMap{ $0 }.map(\.description)).description)
//    }
// }
