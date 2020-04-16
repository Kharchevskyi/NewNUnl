//
//  BFFElementType.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation

/// All elements type which can be rendered in application
public enum BFFAppElement: Equatable {
    case articleLink(URL)
    case settingsTap
    case weather
    case articleHeader
    case articleBody
    case slideshow
//    case more
}
