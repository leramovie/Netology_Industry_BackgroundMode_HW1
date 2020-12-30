//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()

        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground запущен")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive запущен")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillResignActive запущен")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground запущен")
    }
}

