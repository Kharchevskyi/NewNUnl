//
//  File.swift
//  
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//

import Foundation

public struct BFFFetcher {
    public init() {}

    public func fetchAll() -> [BFFElement] {
        return [
            googleLink(),
//            BFFElement.settings(.login)
        ]
    }

    public func googleLink() -> BFFElement {
        BFFElement.articleLink(BFFArticleLink())
    }
}
