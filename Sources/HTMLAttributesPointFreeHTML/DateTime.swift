//
//  DateTime.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the datetime attribute on an element
    @discardableResult
    package func dateTime(
        _ value: DateTime?
    ) -> _HTMLAttributes<Self> {
        self.attribute(DateTime.attribute, value?.description)
    }
}
