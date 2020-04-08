//
//  MainInteractor.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import BFF

protocol MainInteractorInput {
    func handle(action: MainViewController.Action)
}

protocol MainInteractorOutput {
    func proceedTo(scene: MainPresenter.Scene)
    func update(with updateType: MainPresenter.Update)
}

struct MainInteractor: MainInteractorInput {
    private let tracker: TrackerType
    private let output: MainInteractorOutput
    private let bffElementFetcher: BFFFetcher

    init(
        tracker: TrackerType,
        output: MainInteractorOutput,
        bffElementFetcher: BFFFetcher
    ) {
        self.tracker = tracker
        self.output = output
        self.bffElementFetcher = bffElementFetcher
    }


    func handle(action: MainViewController.Action) {
        switch action {
        case .setup:
            // perform some setup, for example fetch something
            fetchBlocks()

            // send event to presenter to update state of a view. Interactor doesn't know anything about view
            output.update(with: MainPresenter.Update.startLoading)

            // track smth (business logic is in iteractor)
            track()
            
            case .scroll(let percent):
                tracker.trackScroll(with: percent)
            case .tapOnLink(let url):
                output.proceedTo(scene: .webView(url))
        }
    }
}

extension MainInteractor {
    private func fetchBlocks() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let allBlocks = self.bffElementFetcher.fetchAll()
            self.output.update(with: .loadedElements(allBlocks))
        }
    }

    private func track() {
        tracker.track()
    }
}
