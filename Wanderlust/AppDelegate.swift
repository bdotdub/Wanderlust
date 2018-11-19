//
//  AppDelegate.swift
//  Wanderlust
//
//  Created by Benny Wong on 11/17/18.
//  Copyright © 2018 Benny Wong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ViewController()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        return true
    }
}
