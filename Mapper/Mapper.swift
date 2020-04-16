//
//  Mapper.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//


import UIKit
import BFF
import HTMLParser

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
            case .logOut:
                return SettingsViewModel(title: bffSettings.rawValue)
            }
            // Patrick: 6) Map your bff model into view representable
        case .weather(let weatherMap):
            return WeatherMapViewModel(weatherMap)
        case .articleTitle(let articleTitle):
            return ArticleTitleViewModel(articleTitle)
        case .articleBody(let articleBody):
            return ArticleBodyMapper().map(articleBody)
        case .slideshow(let urls):
            return SlideShowViewModel(urls: urls.compactMap(URL.init))
        default:
            // Patrick: 5) assertion here because we didn't know about new element. (nil in production code)
            assertionFailure("This bffElement element \(bffElement) is not supported")
            return nil
        }
    }
}



// Example how to "break" mapper into small mappers
struct ArticleBodyMapper {
    let htmlParser = HTMLParser()

    func map(_ model: ArticleBody) -> ArticleBodyViewModel {
        ArticleBodyViewModel(text: htmlParser.attributedString(from: model.bodyHtml))
    }
}

// Example of init mapping
extension ArticleTitleViewModel {
    init(_ model: ArticleTitle) {
        self.init(
            imageUrl: URL(string: model.imageURLstring),
            title: model.title.attributed(with: 20, color: .black),
            subTitle: model.subtitle.attributed(with: 14, color: .black),
            dateString: "05.09.2019".attributed(with: 10, color: .darkGray)
        )
    }
}


