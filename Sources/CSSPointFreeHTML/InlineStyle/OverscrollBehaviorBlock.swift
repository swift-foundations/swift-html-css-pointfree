//
//  OverscrollBehaviorBlock.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func overscrollBehaviorBlock(
        _ overscrollBehaviorBlock: W3C_CSS_Scroll.OverscrollBehaviorBlock?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(overscrollBehaviorBlock, media: media, selector: selector, pseudo: pseudo)
    }
}
