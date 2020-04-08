//
//  ActivityIndicatorNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit
import AsyncDisplayKit

public final class ActivityIndicatorNode: CellNode {
    public struct Input {
        let color: UIColor
        let nodeHeight: CGFloat

        public init(
            color: UIColor,
            nodeHeight: CGFloat
        ) {
            self.color = color
            self.nodeHeight = nodeHeight
        }
    }

    private let input: Input
    private let spinner = SpinnerNode()

    public init(input: Input) {
        self.input = input
        super.init()
        self.spinner.activityIndicatorView.color = input.color
    }

    public override func layoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
        let spec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: spinner)
        spec.style.preferredSize.height = input.nodeHeight
        return spec
    }
}

// Example of UIView embed to ASDisplayNode
final class SpinnerNode: ASDisplayNode {

    var activityIndicatorView: UIActivityIndicatorView {
        return view as! UIActivityIndicatorView
    }

    override init() {
        super.init()
        setViewBlock {
            if #available(iOS 13.0, *) {
                return UIActivityIndicatorView(style: .medium)
            } else {
                return UIActivityIndicatorView(style: .gray)
            }
        }
        style.preferredSize = CGSize(width: 20.0, height: 20.0)
    }

    override func didLoad() {
        super.didLoad()
        activityIndicatorView.startAnimating()
    }
}
