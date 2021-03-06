//
//  MainViewController.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit
import NuUI
import Mapper

protocol MainViewControllerInput {
    func update(with state: MainViewController.State)
}

protocol MainViewControllerOutput {
    func handle(action: MainViewController.Action)
}

final class MainViewController: ASViewController<ASTableNode> {
    enum State {
        case idle
        case loading(ASCellNode)
        case finishedLoading([BFFViewModel])
    }

    private let sceneType: SceneType?
    private var state: State = .idle

    var output: MainViewControllerOutput?

    init(type: SceneType) {
        self.sceneType = type
        super.init(node: ASTableNode())
        node.delegate = self
        node.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        node.view.separatorStyle = .none
        output?.handle(action: .viewController(.setup(sceneType ?? .all)))
    }

    override func viewDidAppear(_ animated: Bool) {
        output?.handle(action: .viewController(.appeared))
    }
}

extension MainViewController: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .idle, .loading: return 1
        case .finishedLoading(let models): return models.count
        }
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        switch state {
        case .idle:
            return { ASCellNode() }
        case let .loading(nodeBlock):
            return { nodeBlock }
        case .finishedLoading(let viewModels):
            let viewModel = viewModels[indexPath.row]
            // TODO: 
//            viewModel.onTap = { nodeType in
//                self.output?.handle(action: .tapOnMenu(nodeType))
//            }
            return viewModel.node()
        }
    }

    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        switch state {
        case .finishedLoading(let models):
            let viewModel = models[indexPath.row]
            let elementType = viewModel.elementType()
            handleElementAction(with: elementType)
        default:
            break
        }
    }
}

extension MainViewController {
    private func handleElementAction(with elementType: BFFAppElement) {
        switch elementType {
        case let .articleLink(url):
            output?.handle(action: .element(.tapOnLink(url)))
        case .settingsTap: break
        case .weather: break
        case .articleHeader: break
        case .articleBody: break
        case .slideshow: break
        }
    }
}

extension MainViewController: MainViewControllerInput {
    func update(with newState: MainViewController.State) {
        self.state = newState
        switch state {
        case .idle:
            break // do nothing
        case .loading:
            node.reloadData()
        case .finishedLoading:
            node.reloadData()
        }
    }
}

extension MainViewController {
    /// all actions that view controller can perform
    enum Action {
        case viewController(ViewControllerAction)
        case userBehaviour(UserAction)
        case element(ElementAction)
    }

    enum ViewControllerAction {
        case setup(SceneType)
        case appeared
    }

    enum UserAction {
        case scroll(_ percent: CGFloat)
    }

    enum ElementAction {
        case tapOnLink(_ url: URL)
        case tapOnLogin
    }
    
}
