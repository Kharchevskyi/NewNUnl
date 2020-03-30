//
//  MainSetting.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit

enum BFFElementType: String, CaseIterable {
    case login, mijnNu, notification, save, feedback
}

typealias ProfileActionType = (BFFElementType) -> Void

struct ViewModel {
    var elementType: BFFElementType
    var node: ASCellNodeBlock
    var onTap: ProfileActionType?
}
