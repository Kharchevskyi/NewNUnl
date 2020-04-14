//
//  MainInteractor.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import BFF
import Tracker

protocol MainInteractorInput {
    func handle(action: MainViewController.Action)
}

protocol MainInteractorOutput {
    func proceedTo(scene: MainPresenter.Scene)
    func update(with updateType: MainPresenter.UpdateEvent)
}

struct MainInteractor: MainInteractorInput {
    enum Constants {
        static let weatherButtonTitle = "Some new title that PO decided even before implementing it on bff\n\nWith multiple lines"
    }

    private let tracker: TrackerType
    private let output: MainInteractorOutput
    private let bffElementFetcher: BFFFetcherType

    init(
        tracker: TrackerType,
        output: MainInteractorOutput,
        bffElementFetcher: BFFFetcherType
    ) {
        self.tracker = tracker
        self.output = output
        self.bffElementFetcher = bffElementFetcher
    }


    func handle(action: MainViewController.Action) {
        switch action {
        case .setup(let scene):
            getElements(for: scene)
        case .scroll(let percent):
            tracker.trackScroll(with: percent)
        case .tapOnLink(let url):
            output.proceedTo(scene: .webView(url))
        case .tapOnLogin:
            output.proceedTo(scene: .loginScene)
        case .appeared:
            // track smth (business logic is in interactor)
            tracker.track()
        }
    }
}

extension MainInteractor { 
    private func getElements(for scene: SceneType) {
        switch scene {
        case .all: fetchAllBlocks()
        case .article(let id): fetchArticle()
        case .settings: fetchSettings()
        }
        // send event to presenter to update state of a view. Interactor doesn't know anything about view
        output.update(with: MainPresenter.UpdateEvent.startLoading)
    }
}

extension MainInteractor {
    private func fetchAllBlocks() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let allBlocks = self.bffElementFetcher.fetchAll()
                .transform(with: Constants.weatherButtonTitle) // Patrick: Transform with some title that you want).
            self.output.update(with: .loadedElements(allBlocks))
        }
    }

    private func fetchSettings() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let allBlocks = self.bffElementFetcher.fetchAll().filter { $0.isSettings }
            self.output.update(with: .loadedElements(allBlocks))
        }
    }

    private func fetchArticle() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let allBlocks = self.bffElementFetcher.fetchArticle()
            self.output.update(with: .loadedElements(allBlocks))
        }
    }
}
