//
//  AppDelegate.swift
//  CoreGraphicAndGesture
//
//  Created by Manh Nguyen Ngoc on 22/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           window = UIWindow(frame: UIScreen.main.bounds)
           let homeViewController = CutAudioViewController()
           let navigationController = UINavigationController(rootViewController: homeViewController)
           navigationController.isNavigationBarHidden = true
           window = UIWindow(frame: UIScreen.main.bounds)
           window?.rootViewController = navigationController
           window?.makeKeyAndVisible()
           return true
       }
}

