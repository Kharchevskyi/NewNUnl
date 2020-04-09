//
//  File.swift
//  
//
//  Created by Anton Kharchevskyi on 09/04/2020.
//

import Foundation

public struct BFFArticleLink: Equatable {
    public let urlString: String

    public init(urlString: String = "https://google.com") {
        self.urlString = urlString
    }
}
