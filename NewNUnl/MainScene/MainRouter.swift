//
//  MainRouter.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit

protocol MainRouting {
    func proceedTo(scene: MainPresenter.Scene)
}

struct MainRouter: MainRouting {

    weak var viewController: MainViewController?

    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func proceedTo(scene: MainPresenter.Scene) {
        switch scene {
        case .webView(let url):
            UIApplication.shared.open(url)
        case .detailScene:
            assertionFailure("Not implemented yet")
        }
    }
}
