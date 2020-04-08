//
//  BFFViewModel.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import AsyncDisplayKit

typealias BFFElementTapAction = () -> Void

protocol BFFViewModel {
    var onTap: BFFElementTapAction? { get set }
    func node() -> ASCellNodeBlock
    func elementType() -> BFFElementType
}

/// All elements type which can be rendered in application
enum BFFElementType {
    case articleLink(URL)
}
