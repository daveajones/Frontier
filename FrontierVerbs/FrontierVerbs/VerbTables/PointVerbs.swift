//
//  PointVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct PointVerbs: VerbTable {
	
	private enum Verb: String {
		case get = "get"
		case set = "set"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .get:
			return get(params)
		case .set:
			return set(params)
		}
	}
}

private extension PointVerbs {
	
	static func get(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func set(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
