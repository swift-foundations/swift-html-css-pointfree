//
//  LinkType.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the type attribute on a link element
    @discardableResult
    package func type(
        _ value: LinkType?
    ) -> _HTMLAttributes<Self> {
        self.attribute(LinkType.attribute, value?.description)
    }
}
