//
//  AppDelegate.swift
//  Space-X
//
//  Created by eyup cimen on 26.09.2021.
//  Copyright © 2021 eyup cimen. All rights reserved.
//

import UIKit
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //var router : AppRouter!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// app.router.mainTabbarBuild()
        SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: UIScreen.main.bounds.width / 2,
        vertical: UIScreen.main.bounds.height / 2))
        
        if (UserDefaults.standard.object(forKey: "kFavoriteRocketDefaultKey") == nil) {
            UserDefaults.standard.set([] , forKey: "kFavoriteRocketDefaultKey")
            UserDefaults.standard.synchronize()
        }
        return true
    }
}
