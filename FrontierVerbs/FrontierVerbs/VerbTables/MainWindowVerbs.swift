//
//  MainWindowVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct MainWindowVerbs: VerbTable {
	
	private enum Verb: String {
		case hideButtons = "hidebuttons"
		case hideFlag = "hideflag"
		case hidePopup = "hidepopup"
		case showButtons = "showbuttons"
		case showFlag = "showflag"
		case showPopup = "showpopup"
		case showServerStats = "showserverstats"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		if verb == .showServerStats {
			return try showServerStats(params, verbAppDelegate)
		}
		return false
	}
}

private extension MainWindowVerbs {
	
	static func showServerStats(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
