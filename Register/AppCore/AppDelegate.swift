//
//  AppDelegate.swift
//  Register
//
//  Created by Mahmoud Sherbeny on 11/03/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupIntialVC()
        return true
    }
    
    func setupIntialVC() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = RegisterViewController()
        let rootNC = UINavigationController(rootViewController: rootVC)
        rootNC.navigationBar.isHidden = true
        rootNC.interactivePopGestureRecognizer?.isEnabled = false
        window?.rootViewController = rootNC
        window?.makeKeyAndVisible()
    }

}

