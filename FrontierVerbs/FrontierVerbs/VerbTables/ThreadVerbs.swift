//
//  ThreadVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// Original Frontier used cooperative threads.
// Some of these verbs don’t make sense in a preemptive world, and are no longer implemented.
// Wish list: verbs for using dispatch queues instead of threads.

struct ThreadVerbs: VerbTable {
	
	private enum Verb: String {
		case exists = "exists"
		case evaluate = "evaluate"
		case callScript = "callScript"
		case getCurrentID = "getcurrentid"
		case getCount = "getcount"
		case getNthID = "getnthid"
		case sleep = "sleep"
		case sleepFor = "sleepfor"
		case sleepTicks = "sleepticks"
		case isSleeping = "isSleeping"
		case wake = "wake"
		case kill = "kill"
		case getTimeSlice = "gettimeslice"
		case setTimeSlice = "setTimeSlice"
		case getDefaultTimeSlice = "getdefaulttimeslice"
		case setDefaultTimeSlice = "setdefaulttimeslice"
		case getStats = "getstats"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .exists:
			return exists(params)
		case .evaluate:
			return evaluate(params)
		case .callScript:
			return callScript(params)
		case .getCurrentID:
			return getCurrentID(params)
		case .getCount:
			return getCount(params)
		case .getNthID:
			return getNthID(params)
		case .sleep:
			return sleep(params)
		case .sleepFor:
			return sleepFor(params)
		case .sleepTicks:
			return sleepTicks(params)
		case .isSleeping:
			return isSleeping(params)
		case .wake:
			return wake(params)
		case .kill:
			return kill(params)
		case .getTimeSlice:
			return VerbResult.noLongerImplemented
		case .setTimeSlice:
			return VerbResult.noLongerImplemented
		case .getDefaultTimeSlice:
			return VerbResult.noLongerImplemented
		case .setDefaultTimeSlice:
			return VerbResult.noLongerImplemented
		case .getStats:
			return getStats(params)
		}
	}
}

private extension ThreadVerbs {
	
	static func exists(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func evaluate(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func callScript(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getCurrentID(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getCount(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getNthID(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func sleep(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func sleepFor(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func sleepTicks(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func isSleeping(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func wake(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func kill(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getStats(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
