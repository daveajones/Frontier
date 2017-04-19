//
//  SemaphoreVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct SemaphoreVerbs: VerbTable {
	
	private enum Verb: String {
		case lock = "lock"
		case unlock = "unlock"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .lock:
			return lock(params)
		case .unlock:
			return unlock(params)
		}
	}
}

private extension SemaphoreVerbs {
	
	static func lock(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func unlock(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
