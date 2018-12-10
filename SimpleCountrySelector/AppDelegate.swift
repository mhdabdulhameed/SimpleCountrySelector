//
//  AppDelegate.swift
//  SimpleCountrySelector
//
//  Created by Mohamed Abdul-Hameed on 12/10/18.
//  Copyright © 2018 Mohamed Abdul-Hameed. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let sceneCoordinator = SceneCoordinator(window: window)
        let homeViewModel = HomeViewModel(sceneCoordinator: sceneCoordinator)
        sceneCoordinator.transition(to: .home(homeViewModel), type: .root)
        
        return true
    }
}

