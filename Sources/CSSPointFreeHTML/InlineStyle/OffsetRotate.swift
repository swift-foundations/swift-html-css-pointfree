//
//  OffsetRotate.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func offsetRotate(
        _ offsetRotate: W3C_CSS_Animations.OffsetRotate?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(offsetRotate, media: media, selector: selector, pseudo: pseudo)
    }
}
