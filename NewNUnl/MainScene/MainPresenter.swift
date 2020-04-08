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
import BFF
import Mapper 

protocol MainPresenterInput {
    func update(with updateType: MainPresenter.Update)
    func proceedTo(scene: MainPresenter.Scene)
}

protocol MainPresenterOutput {
    func update(with state: MainViewController.State)
}

struct MainPresenter {
    enum Update {
        case startLoading
        case loadedElements([BFFElement])
    }

    enum Scene {
        case loginScene
        case webView(URL)
    }

    private let output: MainPresenterOutput
    private let router: MainRouting
    private let mapper: Mapper

    init(output: MainPresenterOutput, router: MainRouting, mapper: Mapper) {
        self.output = output
        self.router = router
        self.mapper = mapper
    }
}

extension MainPresenter: MainPresenterInput {
    func update(with updateType: Update) {
        DispatchQueue.main.async {
            switch updateType {
            case .loadedElements(let elements):
                // map all business models from bff to view representable
                let viewModels = self.mapper.map(elements)
                self.output.update(with: .finishedLoading(viewModels))
                break
            case .startLoading:
                let node = ActivityIndicatorNode(input: ActivityIndicatorNode.Input(color: .red, nodeHeight: UIScreen.main.bounds.height))
                self.output.update(with: .loading(node))
            }
        }
    }

    func proceedTo(scene: MainPresenter.Scene) {
        switch scene {
        case .loginScene:
            print("show scene")
        case .webView(let url):
            router.proceedTo(scene: .webView(url))
        }
    }
} 


