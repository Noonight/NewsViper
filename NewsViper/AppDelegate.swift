//
//  AppDelegate.swift
//  NewsViper
//
//  Created by Aiur on 01.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let vc = NewsListRouter.createModule()
    let navigationController = UINavigationController(rootViewController: vc)
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    
    self.window = window
    
    return true
  }

}

