//
//  MainPresenter.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import NuUI
import UIKit
import NUCommon

protocol MainPresenterInput {
    func update(with updateType: MainPresenter.Update)
    func proceedTo(scene: MainPresenter.Scene)
}

protocol MainPresenterOutput {
    func update(with state: MainViewController.State)
}

struct MainPresenter {
    enum Update {
        case loadedSettings([MainModel])
    }

    enum Scene {
        case detailScene
    }

    private let output: MainPresenterOutput
    private let router: MainRouting

    init(output: MainPresenterOutput, router: MainRouting) {
        self.output = output
        self.router = router
    }
}

extension MainPresenter: MainPresenterInput {
    func update(with updateType: Update) {
        DispatchQueue.main.async {
            switch updateType {
            case .loadedSettings(let settings):
                let viewModels = settings.map(MainViewModel.init)
                self.output.update(with: .finishedLoading(viewModels))
            }
        }
    }
    
    func proceedTo(scene: MainPresenter.Scene) {
        switch scene {
        case .detailScene:
            print("show scene")
        }
    }
}

extension MainViewModel {
    init(model: MainModel) {
        self.settingType = model.mainType

        var input = SettingNode.Input(
            image: .actions,
            title: model.mainType.title.attributed(with: 17, color: .red),
            subTitle: model.mainType.subtitle.attributed(with: 15, color: .blue)
        )

        self.node = input.node

        self.onTap = nil
    }
}

extension MainSettingType {
    var title: String {
        rawValue
    }

    var subtitle: String {
        "Subtitle for \(rawValue)"
    }
}
