//
//  ControlsList.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the controlslist attribute on an element
    @discardableResult
    package func controlsList(
        _ value: ControlsList?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ControlsList.attribute, value?.description)
    }
}
