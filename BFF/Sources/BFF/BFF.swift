
import UIKit

/// All elements that we receive from BFF
/// Based on PR https://source.mondriaan.com/projects/NUIOS/repos/nu_monorepo_ios/pull-requests/314/overview

public enum BFFElement: Equatable {
    case articleLink(BFFArticleLink)
    case settings(Setting)
    case more(More)
    case weather(WeatherMap)

    // Article
    case articleTitle(ArticleTitle)
    case articleBody(ArticleBody)

    // Slideshow
    case slideshow(urls: [String])
}

public extension BFFElement {
    var isSettings: Bool {
        switch self {
        case .settings: return true
        default: return false
        }
    }
}

public extension BFFElement {
    var isWeather: Bool {
        switch self {
        case .weather: return true
        default: return false
        }
    }
}
