//
//  File.swift
//  
//
//  Created by Anton Kharchevskyi on 09/04/2020.
//

import Foundation

// Patrick: 2) Example of model
public struct WeatherMap: Equatable {
    public let rainMapUrl: String

    // Patrick: 3) This one is optional, because for example we haven't implemented this logic on backend
    public let moreTitle: String?

    public init(
        rainMapUrl: String = "https://i.picsum.photos/id/1015/200/200.jpg",
        moreTitle: String? = "More"
    ) {
        self.rainMapUrl = rainMapUrl
        self.moreTitle = moreTitle
    }
}
