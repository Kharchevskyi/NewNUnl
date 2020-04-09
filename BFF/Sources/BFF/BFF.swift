
import UIKit

/// All elements that we receive from BFF
/// Based on PR https://source.mondriaan.com/projects/NUIOS/repos/nu_monorepo_ios/pull-requests/314/overview

public enum BFFElement: Equatable {
    case articleLink(BFFArticleLink)
    case settings(Setting)
    case more(More)

    // Patrick: 1) Add bff element
    case weather(WeatherMap)
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
