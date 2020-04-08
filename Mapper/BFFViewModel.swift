//
//  BFFViewModel.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import AsyncDisplayKit

// future functionality
public typealias BFFElementTapAction = () -> Void

public protocol BFFViewModel {
    var onTap: BFFElementTapAction? { get set }
    func node() -> ASCellNodeBlock
    func elementType() -> BFFElementType
}
