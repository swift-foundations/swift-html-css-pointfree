//
//  ObjectType.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the type attribute on an object element
    @discardableResult
    package func type(
        _ value: ObjectType?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ObjectType.attribute, value?.description)
    }
}
