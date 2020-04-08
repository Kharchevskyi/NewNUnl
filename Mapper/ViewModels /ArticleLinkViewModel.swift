//
//  ArticleLinkViewModel.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit
import NuUI

public struct ArticleLinkViewModel: BFFViewModel {

    public var onTap: BFFElementTapAction?

    private let urlString: String

    public init(urlString: String) {
        self.urlString = urlString
    }

    public func node() -> ASCellNodeBlock {
        {
            let input = LinkNode.Input(urlAtributedString: self.urlString.attributed(with: 20, color: .blue))
            return LinkNode(input: input)
        }
    }

    public func elementType() -> BFFAppElement {
         BFFAppElement.articleLink(URL(string: urlString)!)
    }
}
