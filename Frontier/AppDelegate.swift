//
//  AppDelegate.swift
//  Frontier
//
//  Created by Brent Simmons on 4/11/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	var preferencesWindowController: NSWindowController?

	func applicationDidFinishLaunching(_ aNotification: Notification) {

		let defaults: [String: Any] = [DefaultsKey.launchOpenODB: true]
		UserDefaults.standard.register(defaults: defaults)
	}

	func applicationWillTerminate(_ aNotification: Notification) {

	}

	// MARK: Actions
	
	@IBAction func showPreferences(_ sender: AnyObject) {
		
		if preferencesWindowController == nil {
			preferencesWindowController = windowController(withStoryboardName: "Preferences")
		}
		preferencesWindowController!.showWindow(self)
	}
}

private extension AppDelegate {
	
	func windowController(withStoryboardName name: String) -> NSWindowController {
		
		let storyboard = NSStoryboard(name: name, bundle: nil)
		return storyboard.instantiateInitialController()! as! NSWindowController
	}

}
