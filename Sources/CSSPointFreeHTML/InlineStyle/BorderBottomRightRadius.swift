//
//  BorderBottomRightRadius.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func borderBottomRightRadius(
        _ borderBottomRightRadius: W3C_CSS_Backgrounds.BorderBottomRightRadius?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(borderBottomRightRadius, media: media, selector: selector, pseudo: pseudo)
    }
}
