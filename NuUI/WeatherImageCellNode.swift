//
//  WeatherImageCellNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 09/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//


import Foundation
import AsyncDisplayKit

public final class WeatherImageCellNode: CellNode {
    public struct Input {
        let imageUrl: URL?
        let buttonText: NSAttributedString?

        public init(
            imageUrl: URL?,
            buttonText: NSAttributedString?
        ) {
            self.imageUrl = imageUrl
            self.buttonText = buttonText
        }
    }

    private let input: Input
    private let textNode = ASTextNode()
    private let imageNode = ASNetworkImageNode()

    public init(input: Input) {
        self.input = input
        super.init()
        imageNode.url = input.imageUrl
        textNode.attributedText = input.buttonText
    }

    public override func layoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
        imageNode.style.preferredSize = CGSize(width: 200, height: 200)
        let stack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 20,
            justifyContent: .center,
            alignItems: .center,
            children: [
                imageNode, textNode
            ]
        )

        return ASCenterLayoutSpec(
            centeringOptions: .XY,
            sizingOptions: .minimumXY,
            child: stack
        )
    }
}
