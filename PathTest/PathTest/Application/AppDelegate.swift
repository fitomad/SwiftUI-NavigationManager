//
//  AppDelegate.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 20/9/22.
//

import Foundation
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    var navigatorManager: NavigationManager?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        navigatorManager?.saveAppCurrentState()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        navigatorManager?.restoreAppState()
    }
}
