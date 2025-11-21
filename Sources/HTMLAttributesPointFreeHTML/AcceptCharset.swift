//
//  AcceptCharset.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 04/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the accept-charset attribute on an element
    @discardableResult
    package func acceptCharset(
        _ value: AcceptCharset?
    ) -> _HTMLAttributes<Self> {
        self.attribute(AcceptCharset.attribute, value?.description)
    }
}
