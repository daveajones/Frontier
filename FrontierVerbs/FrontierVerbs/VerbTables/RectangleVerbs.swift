//
//  OSAVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

// No longer implemented.
// These were for QuickDraw Rects, which are not the same as CGRect and NSRect.

struct RectangleVerbs: VerbTable {
	
	private enum Verb: String {
		case get = "get"
		case set = "set"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		return false
	}
}
