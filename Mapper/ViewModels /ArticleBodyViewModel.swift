//
//  Article.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 14/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit
import NuUI


public struct ArticleBodyViewModel: BFFViewModel {
    public var onTap: BFFElementTapAction?

    public let text: NSAttributedString

    public init(
        text: NSAttributedString
    ) {
        self.text = text
    }

    public func node() -> ASCellNodeBlock {
        {
            return TextNode(input: TextNode.Input(self))
        }
    }

    public func elementType() -> BFFAppElement {
        .articleBody
    }
}

extension TextNode.Input {
    init(_ viewModel: ArticleBodyViewModel) {
        self.init(string: viewModel.text)
    }
}
