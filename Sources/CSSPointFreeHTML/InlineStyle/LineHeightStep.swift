//
//  LineHeightStep.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func lineHeightStep(
        _ lineHeightStep: W3C_CSS_Text.LineHeightStep?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(lineHeightStep, media: media, selector: selector, pseudo: pseudo)
    }
}
