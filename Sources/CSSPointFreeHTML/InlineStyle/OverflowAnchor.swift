//
//  OverflowAnchor.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func overflowAnchor(
        _ overflowAnchor: W3C_CSS_BoxModel.OverflowAnchor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(overflowAnchor, media: media, selector: selector, pseudo: pseudo)
    }
}
