///
/// Max.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import HTML_Standard_Attributes
import PointFreeHTML

extension HTML {
    /// Sets the max attribute on an element
    @discardableResult
    package func max(
        _ value: Max?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Max.attribute, value?.description)
    }

    //    /// Sets the max attribute with a date value and format
    //    @discardableResult
    //    package func max(
    //        date: Date,
    //        format: Max.DateFormat = .fullDate
    //    ) -> _HTMLAttributes<Self> {
    //        self.max(Max(date: date, format: format))
    //    }
}
