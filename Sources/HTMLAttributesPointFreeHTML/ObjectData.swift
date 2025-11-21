//
//  ObjectData.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the data attribute on an object element
    @discardableResult
    package func data(
        _ value: ObjectData?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ObjectData.attribute, value?.description)
    }
}
