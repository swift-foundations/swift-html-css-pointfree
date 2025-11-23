//
//  ShapeOutside.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func shapeOutside(
        _ shapeOutside: W3C_CSS_Masking.ShapeOutside?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(shapeOutside, media: media, selector: selector, pseudo: pseudo)
    }
}
