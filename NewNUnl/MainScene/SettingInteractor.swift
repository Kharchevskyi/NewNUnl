//
//  SettingInteractor.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 10/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import Foundation
import BFF

struct SettingInteractor: MainInteractorInput {
    private let output: MainInteractorOutput
    private let bffElementFetcher: BFFFetcherType

    init(
        output: MainInteractorOutput,
        bffElementFetcher: BFFFetcherType
    ) {
        self.output = output
        self.bffElementFetcher = bffElementFetcher
    }

    func handle(action: MainViewController.Action) {
        switch action {
        case .setup:
            fetchSettings()
        default:
            break
        }
    }

    private func fetchSettings() {
        let allSettingsBlocks = bffElementFetcher.fetchAll().filter { $0.isSettings }
        output.update(with: .loadedElements(allSettingsBlocks))
    }
}
