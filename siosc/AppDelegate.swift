//
//  AppDelegate.swift
//  siosc
//
//  Created by Kareem Arab on 2019-01-07.
//  Copyright © 2019 Kareem Arab. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let collectionsViewController: CustomCollectionsViewController = CustomCollectionsViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = collectionsViewController
        window!.makeKeyAndVisible()
        return true
    }

}

