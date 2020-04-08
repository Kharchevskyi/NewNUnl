import Foundation
import AsyncDisplayKit

public final class MoreNode: CellNode {
    public struct Input {
        let title: NSAttributedString

        public init(
            title: NSAttributedString
        ) {
            self.title = title
        }
    }

    private let input: Input
    private let textNode = ASTextNode()

    public init(input: Input) {
        self.input = input
        super.init()
        textNode.attributedText = input.title
    }

    public override func layoutSpecThatFits(_: ASSizeRange) -> ASLayoutSpec {
        ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: textNode)
    }
}
