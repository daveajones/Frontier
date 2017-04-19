//
//  MathVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct MathVerbs: VerbTable {
	
	private enum Verb: String {
		case min = "min"
		case max = "max"
		case sqrt = "sqrt"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .min:
			return min(params)
		case .max:
			return max(params)
		case .sqrt:
			return sqrt(params)
		}
	}
}

private extension MathVerbs {
	
	static func min(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func max(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func sqrt(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
