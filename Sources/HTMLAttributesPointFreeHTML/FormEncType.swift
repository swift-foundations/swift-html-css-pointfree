//
//  formenctype.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the formenctype attribute on an element
    @discardableResult
    package func formEncType(
        _ value: FormEncType?
    ) -> _HTMLAttributes<Self> {
        self.attribute(FormEncType.attribute, value?.description)
    }
}
