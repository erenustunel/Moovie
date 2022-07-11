//
//  AppDelegate.swift
//  TMDBMovieApp
//
//  Created by Eren Üstünel on 10.07.2022.
//

import UIKit
import netfox

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setUpStartView()
        NFX.sharedInstance().start()

        return true
    }
}

private extension AppDelegate {
    func setUpStartView() {
        let vc = SplashViewController(nibName: "SplashViewController", bundle: nil)
        let navController = UINavigationController(rootViewController: vc)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
    
}
