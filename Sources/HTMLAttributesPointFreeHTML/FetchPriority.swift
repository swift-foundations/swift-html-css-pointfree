//
//  Fetchpriority.swift
//  swift-html-css-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {

    /// Sets the fetchpriority attribute on an element
    @discardableResult
    package func fetchPriority(
        _ value: FetchPriority?
    ) -> _HTMLAttributes<Self> {
        self.attribute(FetchPriority.attribute, value?.description)
    }
}
