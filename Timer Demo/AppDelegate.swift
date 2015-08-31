//
//  AppDelegate.swift
//  Timer Demo
//
//  Created by Drarok Ithaqua on 31/08/2015.
//  Copyright (c) 2015 Zerifas Software. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Register for local notifications of the types you need.
		let types: UIUserNotificationType = .None | .Badge | .Alert | .Sound
		let settings = UIUserNotificationSettings(forTypes: types, categories: nil)
		UIApplication.sharedApplication().registerUserNotificationSettings(settings)

		// If there are launch options, check if we're launching due to a user tapping a notification.
		if let options = launchOptions {
			if let notification = options[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification {
				let app = UIApplication.sharedApplication()
				self.application(app, didReceiveLocalNotification: notification)
			}
		}


		return true
	}

	func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
		// After calling registerUserNotificationSettings, the app calls this method to report the results.
		// You can use it to determine if your request was granted or denied by the user.
	}

	func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
		// This code block is invoked when application is still running and a notification fires
		println("application:\(application) didReceiveLocalNotification:\(notification)")
		if let nav = window?.rootViewController as? UINavigationController {
			if let vc = nav.topViewController as? MasterViewController {
				vc.handleNotification(notification)
			}
		}
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

