//
//  SlideShowViewModel.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 16/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit
import NuUI

public struct SlideShowViewModel: BFFViewModel {
    public var onTap: BFFElementTapAction?

    public let urls: [URL]

    public init(
        urls: [URL]
    ) {
        self.urls = urls
    }

    public func node() -> ASCellNodeBlock {
        {
            return SlideShowCollectionNode(input: SlideShowCollectionNode.Input(urls: self.urls, height: 300))
        }
    }

    public func elementType() -> BFFAppElement {
        .slideshow
    }
}
