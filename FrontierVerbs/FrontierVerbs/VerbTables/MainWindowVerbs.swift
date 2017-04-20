//
//  MainWindowVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		if verb == .showServerStats {
			return showServerStats(params, verbAppDelegate)
		}
		return VerbResult.noLongerImplemented
	}
}

private extension MainWindowVerbs {
	
	static func showServerStats(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
