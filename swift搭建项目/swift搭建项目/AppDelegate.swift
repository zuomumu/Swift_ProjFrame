//
//  AppDelegate.swift
//  swift搭建项目
//
//  Created by zuolixia on 2018/1/29.
//  Copyright © 2018年 左. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.red
        let mainVC = TBMainViewController()
        window?.rootViewController = mainVC;
        window?.makeKeyAndVisible()
        print("cddddddd")
        return true
    }
}
