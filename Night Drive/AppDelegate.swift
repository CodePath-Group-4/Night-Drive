//
//  AppDelegate.swift
//  Night Drive
//
//  Created by Rashon Poole on 11/28/20.
//

import UIKit
import Parse
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let parseConfig = ParseClientConfiguration {
                $0.applicationId = "8SGBYUJved9knPVNDQe4maHaP2H3HJuKq85f1qkE" // <- UPDATE
                $0.clientKey = "3fPRtWGDug9L5mfLgyvJLqvfiKLLpcnrMaaLdSW5" // <- UPDATE
                $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        GMSServices.provideAPIKey("AIzaSyCMCsa0SiecS9gwKpDu8F1FejpjKdkkcz4")
        
        // --- end copy

        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

