//
//  MainConfigurator.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit
import BFF
import Mapper
import DI

//binding every vip component to implement outputs of previous component in VIP cycle
extension MainViewController: MainPresenterOutput { }
extension MainInteractor: MainViewControllerOutput { }
extension MainPresenter: MainInteractorOutput { }


struct MainConfigurator {
    static func scene() -> MainViewController {
        let viewController = MainViewController(color: .lightGray)

        let router = MainRouter(viewController: viewController)

        let presenter = MainPresenter(
            output: viewController,
            router: router,
            mapper: inject(type: Mapper.self, fallback: Mapper())
        )

        let interactor = MainInteractor(
            tracker: inject(type: Tracker.self, fallback: Tracker()),
            output: presenter,
            bffElementFetcher: inject(type: BFFFetcher.self, fallback: BFFFetcher())
        )
        
        viewController.output = interactor

        return viewController
    }
}

