//
//  Mapper.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//


import UIKit
import BFF

public struct Mapper {
    public init() { }

    public func map(_ elements: [BFFElement]) -> [BFFViewModel] {
        elements.compactMap(mapElement)
    }

    private func mapElement(_ bffElement: BFFElement) -> BFFViewModel? {
        switch bffElement {
        case .articleLink(let bffArticleLink):
            return ArticleLinkViewModel(urlString: bffArticleLink.urlString)
        case .settings(let bffSettings):
            switch bffSettings {
            case .bookmark:
                return SettingsViewModel(title: bffSettings.rawValue)
            case .login:
                return SettingsViewModel(title: bffSettings.rawValue)
            }
        case .weather(let weatherMap):
            return WeatherMapViewModel(weatherMap)
                
//        case .more(let moreModel):
//            return MoreViewModel(title: moreModel.title)
        default:
            assertionFailure("This bffElement element \(bffElement) is not supported")
            return nil
        }
    }
}

