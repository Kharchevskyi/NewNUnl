//
//  ArticleLinkViewModel.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import NuUI
import NUCommon
import AsyncDisplayKit

struct ArticleLinkViewModel: BFFViewModel {

    var onTap: BFFElementTapAction?

    private let urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    func node() -> ASCellNodeBlock {
        {
            let input = LinkNode.Input(urlAtributedString: self.urlString.attributed(with: 12, color: .blue))
            return LinkNode(input: input)
        }
    }

    func elementType() -> BFFElementType {
         BFFElementType.articleLink(URL(string: urlString)!)
    }
}

