//
//  InitialLetter.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func initialLetter(
        _ initialLetter: W3C_CSS_Text.InitialLetter?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(initialLetter, media: media, selector: selector, pseudo: pseudo)
    }
}
