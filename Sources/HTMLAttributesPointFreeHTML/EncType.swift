///
/// EncType.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Add an EncType attribute to specify the form data encoding type
    @discardableResult
    package func EncType(
        _ value: EncType?
    ) -> _HTMLAttributes<Self> {
        self.attribute(WHATWG_HTML_FormAttributes.EncType.attribute, value?.description)
    }
}
