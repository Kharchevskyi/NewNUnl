
import UIKit

/// All elements that we receive from BFF
public enum BFFElement {
    case articleLink(BFFArticleLink)
    case settings(Setting)
    case more(More)
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
