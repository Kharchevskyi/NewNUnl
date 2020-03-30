//
//  SettingsNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import AsyncDisplayKit

public final class SettingNode: ASCellNode {
    public struct Input {
        public let image: UIImage?
        public let title: NSAttributedString
        public let subTitle: NSAttributedString?

        public var action: (() -> Void)?

        public init(
            image: UIImage?,
            title: NSAttributedString,
            subTitle: NSAttributedString?
        ) {
            self.image = image
            self.title = title
            self.subTitle = subTitle
        }

        public var node: ASCellNodeBlock  {
            return {
                let node = SettingNode(input: self)
                return node
            }
        }
     }


    let imageNode = ASImageNode()
    let titleNode = ASTextNode()
    let subtitleNode = ASTextNode()
    private let input: Input

    public init(input: Input) {
        self.input = input
        super.init()

        automaticallyManagesSubnodes = true
        [imageNode, titleNode, subtitleNode].forEach {
            $0.addTarget(self, action: #selector(onTapAction), forControlEvents: .touchUpInside)
        }
        titleNode.attributedText = input.title
        subtitleNode.attributedText = input.subTitle
        imageNode.image = input.image
    }

    @objc private func onTapAction(_ sender: ASDisplayNode) {
        switch sender {
        case imageNode: input.action?()
        case titleNode: input.action?()
        case subtitleNode: input.action?()
        default: input.action?()
        }
    }

    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let textSpec = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 8,
            justifyContent: .start,
            alignItems: .center,
            children: [titleNode, subtitleNode]
        )

        imageNode.style.preferredSize = CGSize(width: 24, height: 24)

        let finalSepc = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 20,
            justifyContent: .start,
            alignItems: .center,
            children: [imageNode, textSpec]
        )

        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), child: finalSepc)
    }

//    public override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        ASInsetLayoutSpec(
//            insets: UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20),
//            child: ASStackLayoutSpec(
//                direction: .horizontal,
//                spacing: 20,
//                justifyContent: .start,
//                alignItems: .center,
//                children: [
//                    imageNode,
//                    ASStackLayoutSpec(
//                        direction: .vertical,
//                        spacing: 8,
//                        justifyContent: .start,
//                        alignItems: .center,
//                        children: [titleNode, subtitleNode]
//                    )
//                ]
//            )
//        )
//    }
}
