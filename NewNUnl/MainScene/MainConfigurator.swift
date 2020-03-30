//
//  MainConfigurator.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit

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
            router: router
        )

        let interactor = MainInteractor(
            tracker: Tracker(),
            output: presenter
        )
        viewController.output = interactor

        return viewController
    }
}
