//
//  MainSetting.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit

enum MainSettingType: String, CaseIterable {
    case login, mijnNu, notification, save, feedback
}

typealias ProfileActionType = (MainSettingType) -> Void

struct MainViewModel {
    var settingType: MainSettingType
    var node: ASCellNodeBlock

    var onTap: ProfileActionType?
}
