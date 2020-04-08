//
//  AppDelegate.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit
import Mapper
import BFF
import DI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    let dependencyList = DependencyList()
        .with(type: Tracker.self, instance: Tracker())
        .with(type: Mapper.self, instance: Mapper())
        .with(type: BFFFetcher.self, instance: BFFFetcher())
}

// MARK: - DI from responder chain. Will not be used. 
extension AppDelegate {
    @IBAction func dependencyProvider() {}
}
