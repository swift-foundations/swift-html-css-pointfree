//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import PointFreeHTML

extension HTML_Standard_Elements.Area: PointFreeHTML.HTML {
    public var body: some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { HTMLEmpty() }
            //        NEED TO FIX AREA domain model
            //            .shape(self.shape)
            //            .coords(self.coords)
            .alt(self.alt)
            .href(self.href)
            .download(download)
            .ping(ping)
            .referrerPolicy(referrerpolicy)
            .rel(rel)
            .target(target)
    }
}
