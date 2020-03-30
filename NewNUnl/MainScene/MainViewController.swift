//
//  MainViewController.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit
import NuUI

protocol MainViewControllerInput {
    func update(with state: MainViewController.State)
}

protocol MainViewControllerOutput {
    func setup()
    func handle(action: MainViewController.Action)
}

final class MainViewController: ASViewController<ASTableNode> {
    enum State {
        case idle
        case loading
        case finishedLoading([ViewModel])
    }

    enum Action {
        case tapOnMenu(_ type: BFFElementType)
        case scroll(_ percent: CGFloat)
    }

    private var state: State = .idle

    var output: MainViewControllerOutput?

    init(color: UIColor) {
        super.init(node: ASTableNode())
        node.delegate = self
        node.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.setup()
    }
}

extension MainViewController: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .idle, .loading: return 0
        case .finishedLoading(let models): return models.count
        }
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        switch state {
        case .idle, .loading: return { ASCellNode() }
        case .finishedLoading(let models):
            let viewModel = models[indexPath.row]
            // TODO:
//            viewModel.onTap = { nodeType in
//                self.output?.handle(action: .tapOnMenu(nodeType))
//            }
            return viewModel.node
        }
    }

    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        switch state {
        case .finishedLoading(let models):
            let type = models[indexPath.row].elementType
            output?.handle(action: .tapOnMenu(type))
        default:
            break
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
