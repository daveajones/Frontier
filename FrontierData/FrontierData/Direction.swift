//
//  Direction.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public enum Direction: Int {
	
	// Stored on disk: don’t change values.
	
	case noDirection = 0
	case up = 1
	case down = 2
	case left = 3
	case right = 4
	case flatUp = 5
	case flatDown = 6
	case sorted = 8
	case pageUp = 9
	case pageDown = 10
	case pageLeft = 11
	case pageRight = 12
}
