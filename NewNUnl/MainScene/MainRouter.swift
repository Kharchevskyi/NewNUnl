//
//  MainRouter.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation

protocol MainRouting {
    func proceedTo(scene: MainPresenter.Scene)
}

struct MainRouter: MainRouting {
    weak var viewController: MainViewController?

    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func proceedTo(scene: MainPresenter.Scene) {
        
    }
}
