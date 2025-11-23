//
//  BorderTopLeftRadius.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func borderTopLeftRadius(
        _ borderTopLeftRadius: W3C_CSS_Backgrounds.BorderTopLeftRadius?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(borderTopLeftRadius, media: media, selector: selector, pseudo: pseudo)
    }
}
