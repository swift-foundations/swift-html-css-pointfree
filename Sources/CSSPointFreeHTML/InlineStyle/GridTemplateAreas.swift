//
//  GridTemplateAreas.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS_Standard
import PointFreeHTML

extension HTML {
    @discardableResult
    public func gridTemplateAreas(
        _ gridTemplateAreas: W3C_CSS_Grid.GridTemplateAreas?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        self.inlineStyle(gridTemplateAreas, media: media, selector: selector, pseudo: pseudo)
    }
}
