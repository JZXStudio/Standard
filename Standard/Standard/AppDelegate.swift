//
//  AppDelegate.swift
//  Standard
//
//  Created by SONG JIN on 2025/3/11.
//

import UIKit
import AdSupport
import AppTrackingTransparency

import ATools
import Aquarius

@main
class AppDelegate: AAppDelegate {
    private var idfa: String = ""
    
    override func a_DidFinishLaunchingWithOptions(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {

        super.a_DidFinishLaunchingWithOptions(application, didFinishLaunchingWithOptions: launchOptions)
        
        initData()
        setupNotification()
        
        let rootView: TestVC = TestVC()
        
        a_window?.rootViewController = rootView
        a_window?.whiteBackgroundColor()
        a_window?.makeKeyAndVisible()
    }
    
    override func a_NotificationReceive(_ response: UNNotificationResponse) {
        super.a_NotificationReceive(response)
        
    }

    private func initData() -> Void {
        if !AThemeStyle.isSetDarkMode() {
            AThemeStyle.setDarkModeAutoType()
        }
    }
    
    private func setupNotification() -> Void {
        AUserNotification.authorization()
    }
    
    private func getIdea() -> String {
        var idfa: String = ""
        let manager: ASIdentifierManager = ASIdentifierManager.shared()
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                if status == .authorized {
                    idfa = manager.advertisingIdentifier.uuidString
                }
            }
        } else {
            if manager.isAdvertisingTrackingEnabled {
                idfa = manager.advertisingIdentifier.uuidString
            }
        }
        
        return idfa
    }
    // MARK: UISceneSession Lifecycle
    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
     */
}

