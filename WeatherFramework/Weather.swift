//
//  Weather.swift
//  WeatherFramework
//
//  Created by Anton Kharchevskyi on 09/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit
import Mapper
import BFF

// Patrick: 8) Based on PO requirenments change for example title for last weather element.
// Pure function
// Easy to test
// Separate module
public extension Array where Element == BFFElement {
    /// Change title for last weather element
    func transform(with lastWeatherElementTitle: String) -> [BFFElement] {
        // Find last index of weather element
        guard let lastIndex = self.enumerated()
            .filter ({ $0.element.isWeather })
            .last?
            .offset
        else {
            return self
        }

        return self.enumerated().map { offset, element -> BFFElement in
            guard offset == lastIndex else { return element }

            switch element {
            case .weather(let weatherModel):
                return .weather(
                    WeatherMap(
                        rainMapUrl: weatherModel.rainMapUrl,
                        moreTitle: lastWeatherElementTitle
                    )
                )
            default:
                return element
            }
        }
    }
}
