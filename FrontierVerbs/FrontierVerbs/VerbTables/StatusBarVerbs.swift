//
//  StatusBarVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// No longer implemented.
// These were Windows-only.

struct StatusBarVerbs: VerbTable {
	
	private enum Verb: String {
		case msg = "msg"
		case setSections = "setsections"
		case getSections = "getsections"
		case getSectionOne = "getsectionone"
		case getMessage = "getmessage"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		return VerbResult.noLongerImplemented
	}
}
