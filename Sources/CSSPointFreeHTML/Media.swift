//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 17/09/2024.
//

import CSS_Standard
import PointFreeHTML



extension HTMLInlineStyle {
    @_disfavoredOverload
    public func inlineStyle(
        _ property: String,
        _ value: String?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: PointFreeHTML.Pseudo? = nil
    ) -> HTMLInlineStyle {
        return self.inlineStyle(
            property,
            value,
            atRule: media.map(\.rawValue).map(PointFreeHTML.AtRule.Media.init(rawValue:)),
            selector: selector,
            pseudo: pseudo
        )
    }
}
