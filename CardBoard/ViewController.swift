//
//  ViewController.swift
//  CardBoard
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import NuUI

class ViewController: ASViewController<ASTableNode> {
    enum UIElements: CaseIterable {
        case settingsNode
        case weather
        case weatherWithButton
    }

    let allElements: [UIElements] = UIElements.allCases
    var color: UIColor?

    init(color: UIColor = .white) {
        super.init(node: ASTableNode())
        node.delegate = self
        node.dataSource = self
        self.color = color
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        node.reloadData()
    }
}


extension ViewController: ASTableDelegate, ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        allElements.count
    }

    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let uielement = allElements[indexPath.row]

        switch uielement {
        case .settingsNode:
            return {
                let input = SettingNode.Input(
                    image: .remove,
                    title: NSAttributedString(
                        string: "Settings test",
                        attributes: [
                            NSAttributedString.Key.foregroundColor : UIColor.red,
                            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 23)
                        ]
                    ),
                    subTitle: NSAttributedString(
                        string: "Settings Subtitle",
                        attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue]
                    )
                )
                return SettingNode(input: input)
            }
        case .weather:
            return {
                WeatherImageCellNode(
                    input: WeatherImageCellNode.Input(
                        imageUrl: URL(string: "https://picsum.photos/200"),
                        buttonText: nil
                    )
                )
            }
            // Patrick: 7) You can Run this one screen app to see how it looks like.
            // Don't need to implement it even in NUnl app at all.
        case .weatherWithButton:
            return {
                WeatherImageCellNode(
                    input: WeatherImageCellNode.Input(
                        imageUrl: URL(string: "https://picsum.photos/200"),
                        buttonText: NSAttributedString(string: "Text")
                    )
                )
            }
        }
    }

    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {

    }
}
