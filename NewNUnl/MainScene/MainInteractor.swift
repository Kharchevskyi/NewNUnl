//
//  MainInteractor.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation

protocol MainInteractorInput {
    func setup()
    func handle(action: MainViewController.Action)
}

protocol MainInteractorOutput {
    func proceedTo(scene: MainPresenter.Scene)
    func update(with updateType: MainPresenter.Update)
}

struct MainInteractor: MainInteractorInput {
    private let tracker: TrackerType
    private let output: MainInteractorOutput

    init(
        tracker: TrackerType,
        output: MainInteractorOutput
    ) {
        self.tracker = tracker
        self.output = output
    }

    func setup() {
        // perform some setup of buisnes logic
        // fetch something or subscribe for notification
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let allMenuItems = BFFElementType.allCases.map(BFFElement.init)
            self.output.update(with: .loadedSettings(allMenuItems))
        }
    }

    func handle(action: MainViewController.Action) {
        switch action {
        case .tapOnMenu:
            output.proceedTo(scene: .detailScene)
        case .scroll(let percent):
            tracker.trackScroll(with: percent)
        }
    }
}
