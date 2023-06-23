//
//  AppDelegate.swift
//
//  Created by Martijn van de Bovenkamp on 10/03/2022.
//  Copyright © 2022 Braze. All rights reserved.
//

import UIKit
import BrazeKit
import BrazeUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    static var braze: Braze? = nil
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // TODO: Insert Braze instance configuration here
        var configuration = Braze.Configuration(
                      apiKey: "<BRAZE_API_KEY>",
                      endpoint: "<BRAZE_ENDPOINT>"
                    )
        
        // TODO: Change session timeout here
        
        // Allow certain fields from being collected automatically
        
        // TODO: Insert logging information here
        
        // Create Braze instance using configuration
          let braze = Braze(configuration: configuration)
          AppDelegate.braze = braze
        
        // Enable logging of general SDK information (e.g. user changes, etc.)
        
        // TODO: Create Braze instance using configuration here
        
        // TODO: Add BrazeInAppMessageUI object and set it on the Braze instance’s inAppMessagePresenter here

        // TODO: Add Push Registration code here
    
        // TODO: Add Support for Action Buttons here

        // TODO: Add delegate on current User Notification center here
        
        // TODO: Add code to request authorization to display user notifications
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //TODO: Add Register Device Token here
    
    }
    
    // TODO: Add Push handling - didReceiveRemoteNotification here
 
    // TODO: Add Push handling - userNotificationCenter here

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    // TODO: Add Push handling - willPresent here
    
}


//MARK: - IN-APP MESSAGE PRESENTATION CUSTOMISATION
extension AppDelegate: BrazeInAppMessageUIDelegate {
  func inAppMessage(
    _ ui: BrazeInAppMessageUI,
    prepareWith context: inout BrazeInAppMessageUI.PresentationContext){
    // Customize the in-app message presentation here using the context
    let inAppMessage = context.message
    // TODO: add margin attribute here
      
    }
}
