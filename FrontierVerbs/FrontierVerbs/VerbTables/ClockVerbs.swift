//
//  ClockVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct ClockVerbs: VerbTable {
	
	private enum Verb: String {
		case now = "now"
		case sleepFor = "sleepFor"
		case ticks = "ticks"
		case milliseconds = "milliseconds"
		case waitSeconds = "waitseconds"
		case waitSixtieths = "waitsixtieths"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .now:
			return now(params)
		case .sleepFor:
			return sleepFor(params)
		case .ticks:
			return ticks(params)
		case .milliseconds:
			return milliseconds(params)
		case .waitSeconds:
			return waitSeconds(params)
		case .waitSixtieths:
			return waitSixtieths(params)
		}
	}
}

private extension ClockVerbs {
	
	static func now(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func sleepFor(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func ticks(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func milliseconds(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func waitSeconds(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func waitSixtieths(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
