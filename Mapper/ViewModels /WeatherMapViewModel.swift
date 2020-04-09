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

public extension Array where Element == BFFViewModel {
    /// changing title for last weather element
    func mapWithLastWeather(title: NSAttributedString) -> [BFFViewModel] {
        guard self.contains(where: { $0.elementType() == .weather }) else {
            return self
        }

        // Find last index of weather page
        let lastIndex = self.enumerated()
            .filter { $0.element.elementType() == .weather }
            .last?
            .offset

        return self.enumerated().map { offset, element -> BFFViewModel in
            if element.elementType() == .weather, offset == lastIndex {
                return WeatherMapViewModel(
                    buttonTitle: title,
                    imageUrl: (element as? WeatherMapViewModel)?.imageUrl
                )
            }
            return element
        }
    }
}




