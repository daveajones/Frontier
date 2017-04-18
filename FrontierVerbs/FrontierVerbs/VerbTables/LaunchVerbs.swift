//
//  LaunchVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct LaunchVerbs: VerbTable {
	
	private enum Verb: String {
		case appleMenu = "appleMenu"
		case application = "application"
		case appWithDocument = "appwithdocument"
		case resource = "resource"
		case anything = "anything"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .appleMenu:
			return VerbResult.noLongerImplemented
		case .application:
			return launchApplication(params)
		case .appWithDocument:
			return launchAppWithDocument(params)
		case .resource:
			return VerbResult.noLongerImplemented
		case .anything:
			return launchAnything(params)
		}
	}
}

private extension LaunchVerbs {
	
	static func launchApplication(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func launchAppWithDocument(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func launchAnything(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
