//
//  SceneDelegate.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)

        let main = MainConfigurator.scene()
        main.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)

        let settings = MainConfigurator.scene(sceneType: .settings)
        settings.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarController = UITabBarController()

        tabBarController.viewControllers = [main, settings]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene


        

    }
}

