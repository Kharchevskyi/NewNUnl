//
//  TextNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 14/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import AsyncDisplayKit

public final class TextNode: CellNode {
    public struct Input {
        let string: NSAttributedString

        public init(
            string: NSAttributedString
        ) {
            self.string = string
        }
    }

    private let input: Input
    private let textNode = ASTextNode()

    public init(input: Input) {
        self.input = input
        super.init()
        textNode.attributedText = input.string
    }

    public override func layoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
        ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
            child: textNode
        )
    }
}
