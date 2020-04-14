//
//  ArticleHeaderNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 14/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit

public final class ArticleHeaderNode: CellNode {
    public struct Input {
        let imageUrl: URL?
        let title: NSAttributedString
        let subtitle: NSAttributedString
        let date: NSAttributedString?

        public init(
            imageUrl: URL?,
            title: NSAttributedString,
            subtitle: NSAttributedString,
            date: NSAttributedString?
        ) {
            self.imageUrl = imageUrl
            self.title = title
            self.subtitle = subtitle
            self.date = date
        }
    }

    private let input: Input

    private let imageNode = ASNetworkImageNode()
    private let textNode = ASTextNode()
    private let subtitleNode = ASTextNode()
    private let dateNode = ASTextNode()

    public init(input: Input) {
        self.input = input
        super.init()
        imageNode.url = input.imageUrl
        textNode.attributedText = input.title
        subtitleNode.attributedText = input.subtitle
        dateNode.attributedText = input.date
    }

    public override func layoutSpecThatFits(_ size: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.preferredSize = CGSize(width: size.max.width, height: size.max.width*0.7)
        imageNode.gradientBackgroundColor(
            [
                UIColor.lightGray.withAlphaComponent(0.1).cgColor,
                UIColor.darkGray.withAlphaComponent(0.5).cgColor
            ],
            direction: .vertical
        )

        let imageHeader = ASOverlayLayoutSpec(
            child: imageNode,
            overlay: ASInsetLayoutSpec(
                insets: UIEdgeInsets(
                    top: .infinity,
                    left: 16,
                    bottom: 8,
                    right: 16
                ),
                child: textNode
            )
        )

        let subtitleSpec = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16),
            child: subtitleNode
        )
        let stack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 20,
            justifyContent: .start,
            alignItems: .start,
            children: [
                imageHeader,
                subtitleSpec,
                dateNode
            ]
        )

        return stack
    }
}
