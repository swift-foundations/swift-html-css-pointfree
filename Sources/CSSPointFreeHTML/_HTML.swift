//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func inlineStyle<PropertyElement: W3C_CSS_Shared.Property>(
        _ property: PropertyElement?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: PointFreeHTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(
            PropertyElement.property,
            property?.description,
            media: media.map { PointFreeHTML.AtRule.Media($0) },
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func inlineStyle(
        _ property: String,
        _ value: String?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: PointFreeHTML.Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(
            property,
            value,
            media: media.map { PointFreeHTML.AtRule.Media($0) },
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension PointFreeHTML.AtRule.Media {
    package init(_ media: W3C_CSS_MediaQueries.Media) {
        self = .init(rawValue: media.rawValue)
    }
}
