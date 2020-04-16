//
//  SlideShowCollectionNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 16/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit

public final class SlideShowCollectionNode: CellNode {
    public struct Input {
        let urls: [URL]
        let height: CGFloat

        public init(
            urls: [URL],
            height: CGFloat
        ) {
            self.urls = urls
            self.height = height
        }
    }

    private let input: Input

    private let imageNode = ASNetworkImageNode()
    private let textNode = ASTextNode()
    private let subtitleNode = ASTextNode()
    private let dateNode = ASTextNode()

    let collectionNode: ASCollectionNode

    public init(input: Input) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: input.height, height: input.height)

        collectionNode = ASCollectionNode(collectionViewLayout: layout)

        self.input = input
        super.init()
        collectionNode.dataSource = self
        DispatchQueue.main.async {
            self.collectionNode.reloadData()
        }

    }

    public override func layoutSpecThatFits(_ size: ASSizeRange) -> ASLayoutSpec {
        collectionNode.style.preferredSize = CGSize(width: size.max.width, height: input.height)

        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(
                top: 8,
                left: 8,
                bottom: 8,
                right: 8
            ),
            child: collectionNode
        )
    }
}

extension SlideShowCollectionNode: ASCollectionDataSource {
    public func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        input.urls.count
    }

    public func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            WeatherImageCellNode(
                input: WeatherImageCellNode.Input(
                    imageUrl: self.input.urls[indexPath.row],
                    buttonText: nil,
                    height: self.input.height
                )
            )
        }
    }
}
