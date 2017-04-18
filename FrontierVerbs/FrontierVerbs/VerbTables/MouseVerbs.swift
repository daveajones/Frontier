//
//  MouseVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct MouseVerbs: VerbTable {
	
	private enum Verb: String {
		case button = "button"
		case location = "location"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .button:
			return button(params)
		case .location:
			return location(params)
		}
	}
}

private extension MouseVerbs {
	
	static func button(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func location(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
