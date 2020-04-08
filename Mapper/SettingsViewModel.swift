//
//  SettingsViewModel.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import NuUI

public struct SettingsViewModel: BFFViewModel {
    public var onTap: BFFElementTapAction?

    private let title: String

    public init(title: String) {
        self.title = title
    }

    public func node() -> ASCellNodeBlock {
        {
            let input = SettingNode.Input(
                image: .add,
                title: self.title.attributed(with: 20, color: .red),
                subTitle: nil
            )
            return SettingNode(input: input)
        }
    }

    public func elementType() -> BFFElementType {
         BFFElementType.settingsTap
    }
}
