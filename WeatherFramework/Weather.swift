//
//  Weather.swift
//  WeatherFramework
//
//  Created by Anton Kharchevskyi on 09/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import Mapper

public extension Array where Element == BFFViewModel {
    /// changing title for last weather element
    func mapWithLastWeather(title: NSAttributedString) -> [BFFViewModel] {
        // Find last index of weather element
        guard let lastIndex = self.enumerated()
            .filter ({ $0.element.elementType() == .weather })
            .last?
            .offset
        else {
            return self
        }

        return self.enumerated().map { offset, element -> BFFViewModel in
            guard offset == lastIndex else { return element }

            guard let imageUrl = (element as? WeatherMapViewModel)?.imageUrl else {
                assertionFailure("No proper element returned \(print(type(of: self[lastIndex])))")
                return element
            }

            return WeatherMapViewModel(
                buttonTitle: title,
                imageUrl: imageUrl
            )
        }
    }
}
