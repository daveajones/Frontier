//
//  PointVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

// No longer implemented.
// QuickTime is deprecated.
// Wish list: a rich set of media scripting verbs.

struct QuickTimeVerbs: VerbTable {
	
	private enum Verb: String {
		case open = "open"
		case play = "play"
		case stop = "stop"
		case isPlaying = "isplaying"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		return false
	}
}
