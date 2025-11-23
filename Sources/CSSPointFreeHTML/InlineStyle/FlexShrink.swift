//
//  FlexShrink.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func flexShrink(
        _ flexShrink: W3C_CSS_Flexbox.FlexShrink? = 1,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(flexShrink, media: media, selector: selector, pseudo: pseudo)
    }
}
