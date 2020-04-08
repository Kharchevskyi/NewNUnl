
import UIKit

public enum BFFElement {
    case articleLink(BFFArticleLink)
    case settings(Setting)
    case more
}

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
