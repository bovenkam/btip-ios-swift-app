//
//  AppDelegate.swift
//
//  Created by Martijn van de Bovenkamp on 10/03/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var braze: Braze? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Insert Braze instance configuration here
      
        // Insert logging information here
        
        // Enable logging of general SDK information (e.g. user changes, etc.)
        
        // Create Braze instance using configuration
        
        // Add BrazeInAppMessageUI object and set it on the Braze instance’s inAppMessagePresenter here

        // Add Push Registration code here
    
        // Add Support for Action Buttons here

        // Add delegate on current User Notification center here
        
        // Add code to request authorization to display user notifications
        
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //Add Register Device Token here
    
    }
    
    // Add Push handling - didReceiveRemoteNotification here
 
    // Add Push handling - userNotificationCenter here


}

extension AppDelegate: UNUserNotificationCenterDelegate {

    // Add Push handling - willPresent here
    
}


//MARK: - IN-APP MESSAGE PRESENTATION CUSTOMISATION
extension AppDelegate: BrazeInAppMessageUIDelegate {

  func inAppMessage(
    _ ui: BrazeInAppMessageUI,
    prepareWith context: inout BrazeInAppMessageUI.PresentationContext){
    // Customize the in-app message presentation here using the context
    let inAppMessage = context.message
      
    // Add conditional logic for IAM here
        

    }

}













