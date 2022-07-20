//
//  AppDelegate.swift
//
//  Created by Martijn van de Bovenkamp on 10/03/2022.
//

import UIKit
import AppboyUI
import AppboyKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let apiKey = "08986b62-610c-4be2-b0cd-150a8048ecfc"
        let endpointToUse = "sondheim.braze.com"
        
        var appboyOptions: [String: Any] {
          return [
            ABKEndpointKey: endpointToUse,
            ABKMinimumTriggerTimeIntervalKey: 10,
            ABKSessionTimeoutKey: 15
          ]
        }
        
        Appboy.start(withApiKey: apiKey, in:application, withLaunchOptions:launchOptions, withAppboyOptions: appboyOptions)
        
        
        
        //INSERT IAM UI delegate here
        Appboy.sharedInstance()?.inAppMessageController.inAppMessageUIController?.setInAppMessageUIDelegate?(self)
        
        //Add Push Notification code here
        if #available(iOS 10, *) {
          let center = UNUserNotificationCenter.current()
          center.delegate = self as? UNUserNotificationCenterDelegate
          var options: UNAuthorizationOptions = [.alert, .sound, .badge]
          if #available(iOS 12.0, *) {
            options = UNAuthorizationOptions(rawValue: options.rawValue | UNAuthorizationOptions.provisional.rawValue)
          }
          center.requestAuthorization(options: options) { (granted, error) in
            Appboy.sharedInstance()?.pushAuthorization(fromUserNotificationCenter: granted)
          }
          UIApplication.shared.registerForRemoteNotifications()
        } else {
          let types : UIUserNotificationType = [.alert, .badge, .sound]
          let setting : UIUserNotificationSettings = UIUserNotificationSettings(types:types, categories:nil)
          UIApplication.shared.registerUserNotificationSettings(setting)
          UIApplication.shared.registerForRemoteNotifications()
        }
        
        return true
    }
    
    //MARK: - Braze PUSH Integration

    //Add register device token here
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            //Add Register Device Token here
            Appboy.sharedInstance()?.registerDeviceToken(deviceToken)
        }
    
    //Add Push handling - didReceiveRemoteNotification here
    func application(_ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                                 fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    Appboy.sharedInstance()?.register(application,
                               didReceiveRemoteNotification: userInfo,
                                fetchCompletionHandler: completionHandler)
    }
    
    //Add Push handling - userNotificationCenter here
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
    Appboy.sharedInstance()?.userNotificationCenter(center,
                                didReceive: response,
                                  withCompletionHandler:completionHandler)
    }
    
    //Add Push handling - willPresent here (allowing push to display when the app is open)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                  willPresent notification: UNNotification,
                                  withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      if #available(iOS 14.0, *) {
        completionHandler([.list, .banner]);
      } else {
        completionHandler([.alert]);
      }
    }

    

    
}



// MARK: - CUSTOM VIEW CONTROLLER LOGIC HERE ABKInAppMessage UI Delegate
extension AppDelegate: ABKInAppMessageUIDelegate {
    func inAppMessageViewControllerWith(_ inAppMessage: ABKInAppMessage) -> ABKInAppMessageViewController? {
    
    switch inAppMessage {
      case is ABKInAppMessageSlideup:
        return SlideUpWithOffsetViewController(inAppMessage: inAppMessage)
      case is ABKInAppMessageModal:
          return ABKInAppMessageModalViewController(inAppMessage: inAppMessage)
      case is ABKInAppMessageFull:
          return ABKInAppMessageFullViewController(inAppMessage: inAppMessage)
      case is ABKInAppMessageHTML:
        return ABKInAppMessageHTMLViewController(inAppMessage: inAppMessage)
      default:
        return ABKInAppMessageViewController(inAppMessage: inAppMessage)
      }
    }
}












