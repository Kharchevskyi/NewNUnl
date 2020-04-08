//
//  LinkNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import AsyncDisplayKit

public final class LinkNode: CellNode {
    public struct Input {
        let urlAtributedString: NSAttributedString

        public init(
            urlAtributedString: NSAttributedString
        ) {
            self.urlAtributedString = urlAtributedString
        }
    }

    private let input: Input
    private let textNode = ASTextNode()

    public init(input: Input) {
        self.input = input
        super.init()
        textNode.attributedText = input.urlAtributedString
    }

    public override func layoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
        ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
            child: textNode
        )
    }
}
