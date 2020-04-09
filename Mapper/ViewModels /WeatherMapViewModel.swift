//
//  WeatherMapViewModel.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 09/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import NuUI
import BFF

public struct WeatherMapViewModel: BFFViewModel {
    public var onTap: BFFElementTapAction?

    public var buttonTitle: NSAttributedString?
    public private(set) var imageUrl: URL?

    public init(
        buttonTitle: NSAttributedString? = nil,
        imageUrl: URL? = nil
    ) {
        self.buttonTitle = buttonTitle
        self.imageUrl = imageUrl
    }

    public func node() -> ASCellNodeBlock {
        {
            let input = WeatherImageCellNode.Input(
                imageUrl: self.imageUrl,
                buttonText: self.buttonTitle
            )
            return WeatherImageCellNode(input: input)
        }
    }

    public func elementType() -> BFFAppElement {
         .weather
    }
}


public extension WeatherMapViewModel {
    init(_ weatherMap: WeatherMap) {
        self.buttonTitle = (weatherMap.moreTitle ?? "").attributed(with: 20, color: .blue)
        self.imageUrl = URL(string: weatherMap.rainMapUrl)
    }
}
