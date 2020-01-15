//
//  AppDelegate.swift
//  HomeTask
//
//  Created by Yin Hua on 14/1/20.
//  Copyright © 2020 Yin Hua. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainController)
        navigationController.navigationBar.isTranslucent = false
        self.window?.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
}

