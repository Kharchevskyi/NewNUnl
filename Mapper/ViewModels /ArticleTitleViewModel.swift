//
//  ArticleTitleViewModel.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 14/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit
import NuUI


public struct ArticleTitleViewModel: BFFViewModel {
    public var onTap: BFFElementTapAction?

    public let imageUrl: URL?
    public let title: NSAttributedString
    public let subTitle: NSAttributedString
    public let dateString: NSAttributedString?

    public init(
        imageUrl: URL?,
        title: NSAttributedString,
        subTitle: NSAttributedString,
        dateString: NSAttributedString
    ) {
        self.imageUrl = imageUrl
        self.title = title
        self.subTitle = subTitle
        self.dateString = dateString
    }

    public func node() -> ASCellNodeBlock {
        {
            return ArticleHeaderNode(input: ArticleHeaderNode.Input(self))
        }
    }

    public func elementType() -> BFFAppElement {
        .articleHeader
    }
}

private extension ArticleHeaderNode.Input {
    init(_ viewModel: ArticleTitleViewModel) {
        self.init(
            imageUrl: viewModel.imageUrl,
            title: viewModel.title,
            subtitle: viewModel.subTitle,
            date: viewModel.dateString
        )
    }
}
