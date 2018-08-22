//
//  AppDelegate.swift
//  Reddit
//
//  Created by Yalcin Ozdemir on 22.08.2018.
//  Copyright © 2018 Yalcin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.setMainWindow()
        self.configureNavigation()
        return true
    }
    
    func configureNavigation() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.backgroundColor = UIColor.black
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationBarAppearance.barTintColor = UIColor.black
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearance.shadowImage = UIImage()
        UIApplication.shared.statusBarStyle = .lightContent
        if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusbar.backgroundColor = UIColor.black
        }
    }
    
    func setMainWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.black
        let vc = MainViewController()
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        self.window = window
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

