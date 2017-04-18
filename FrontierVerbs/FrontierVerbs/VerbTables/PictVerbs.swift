//
//  PictVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// No longer implemented.

struct PictVerbs: VerbTable {
	
	private enum Verb: String {
		case scheduleUpdate = "scheduleupdate"
		case expressions = "expression"
		case getPicture = "getpicture"
		case setPicture = "setpicture"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		return VerbResult.noLongerImplemented
	}
}
