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
}

public struct BFFFetcher: BFFFetcherType {
    public init() {}

    /// Example of fetching all Elements
    public func fetchAll() -> [BFFElement] {
        [
            googleLink(),
            BFFElement.weather(WeatherMap(moreTitle: nil)),
            BFFElement.settings(.login),
            BFFElement.settings(.bookmark),
            BFFElement.weather(WeatherMap()),
            BFFElement.weather(WeatherMap())
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

    func googleLink() -> BFFElement {
        BFFElement.articleLink(BFFArticleLink())
    }
}
