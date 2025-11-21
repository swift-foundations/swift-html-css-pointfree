//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 09/04/2025.
//

import HTML_Standard_Elements
import PointFreeHTML

// extension HTMLVoidElement where Self: HTML_Standard_Elements.HTMLElement & PointFreeHTML.HTML {
//    public var body: PointFreeHTML.HTMLElement<HTMLEmpty> {
//        PointFreeHTML.HTMLElement(tag: Self.tag) { PointFreeHTML.HTMLEmpty() }
//    }
// }

// WORKAROUND because Input and BR fail to compile when called as BR(). With this function BR()() works
extension HTMLVoidElement where Self: HTML_Standard_Elements.HTMLElement & PointFreeHTML.HTML {
    public func callAsFunction() -> some PointFreeHTML.HTML {
        self
    }
}
