//
//  RGBVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// No longer implemented.
// These were for QuickDraw RGB structures, which are no longer relevant.

struct RGBVerbs: VerbTable {
	
	private enum Verb: String {
		case get = "get"
		case set = "set"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		return VerbResult.noLongerImplemented
	}
}
