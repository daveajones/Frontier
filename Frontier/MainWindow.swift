//
//  MainWindow.swift
//  Frontier
//
//  Created by Brent Simmons on 4/18/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa

class MainWindow: NSWindow {

	override init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
		
		super.init(contentRect: contentRect, styleMask: style, backing: bufferingType, defer: flag)
		isMovableByWindowBackground = true
	}
}
