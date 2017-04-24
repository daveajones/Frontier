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
// Wish list: implement verbs using SearchKit for creating and searching indexes.

struct SearchEngineVerbs: VerbTable {
	
	private enum Verb: String {
		case stripMarkup = "stripmarkup"
		case deIndexPage = "deindexpage"
		case indexPage = "indexpage"
		case cleanIndex = "cleanindex"
		case mergeResults = "mergeresults"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		return false
	}
}
