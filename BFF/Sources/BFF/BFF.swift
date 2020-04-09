
import UIKit

/// All elements that we receive from BFF
/// Based on PR https://source.mondriaan.com/projects/NUIOS/repos/nu_monorepo_ios/pull-requests/314/overview

public enum BFFElement {
    case articleLink(BFFArticleLink)
    case settings(Setting)
    case more(More)
    case weather(WeatherMap)
}


/// BFF Associated models
public struct BFFArticleLink {
    public let urlString: String

    public init(urlString: String = "https://google.com") {
        self.urlString = urlString
    }
}

public enum Setting: String {
    case login
    case bookmark
//    case logOut
}

public struct More {
    public let title: String

    public init(title: String) {
        self.title = title
    }
}

public struct WeatherMap {
    public let rainMapUrl: String
    public let moreTitle: String?

    public init(
        rainMapUrl: String = "https://i.picsum.photos/id/1015/200/200.jpg",
        moreTitle: String? = "More"
    ) {
        self.rainMapUrl = rainMapUrl
        self.moreTitle = moreTitle
    }
}
