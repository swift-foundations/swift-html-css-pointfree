//
//  ButtonType.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the type attribute on a button element
    @discardableResult
    package func type(
        _ value: ButtonType?
    ) -> _HTMLAttributes<Self> {
        self.attribute(ButtonType.attribute, value?.rawValue)
    }
}
