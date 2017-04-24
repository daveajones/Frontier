//
//  StatusBarVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		return false
	}
}
