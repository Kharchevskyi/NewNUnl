//
//  File.swift
//  
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//

import Foundation

public protocol BFFFetcherType {
    func fetchAll() -> [BFFElement]
    func fetchSettings() -> [BFFElement]
    func fetchArticle() -> [BFFElement]
}

public struct BFFFetcher: BFFFetcherType {
    public init() {}

    /// Example of fetching all Elements
    public func fetchAll() -> [BFFElement] {
        [
            googleLink(),
            // Patrick: 4) Return this element from backend. 
            BFFElement.weather(WeatherMap(moreTitle: nil)),
            BFFElement.settings(.login),
            BFFElement.settings(.bookmark),
            BFFElement.weather(WeatherMap()),
            BFFElement.weather(WeatherMap()),
            BFFElement.settings(.logOut)
//            BFFElement.more(More(title: "More Title"))
        ]
    }


    // Example of fetching Elements
    public func fetchSettings() -> [BFFElement] {
        [
            BFFElement.settings(.login),
            BFFElement.settings(.bookmark),
        ]
    }

    public func fetchArticle() -> [BFFElement] {
        [
            BFFElement.articleTitle(ArticleTitle()),
            BFFElement.articleBody(ArticleBody.block1),
            BFFElement.articleBody(ArticleBody.block2),
            BFFElement.articleBody(ArticleBody.block3),
            BFFElement.articleBody(ArticleBody.block4)
        ]
    }

    func googleLink() -> BFFElement {
        BFFElement.articleLink(BFFArticleLink())
    }
}

