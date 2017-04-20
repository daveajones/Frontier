//
//  FrontierVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct FrontierVerbs: VerbTable {
	
	private enum Verb: String {
		case getProgramPath = "getprogrampath"
		case getFilePath = "getfilepath"
		case enableAgents = "enableagents"
		case requestToFront = "requesttofront"
		case isRuntime = "isruntime"
		case countThreads = "countthreads"
		case isPowerPC = "ispowerpc"
		case reclaimMemory = "reclaimmemory"
		case version = "version"
		case hashStats = "hashstats"
		case getHashloopCount = "gethashloopcount"
		case hideApplication = "hideapplication"
		case isValidSerialNumber = "isvalidserialnumber"
		case showApplication = "showapplication"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .getProgramPath:
			return getProgramPath(params, verbAppDelegate)
		case .getFilePath:
			return getFilePath(params, verbAppDelegate)
		case .enableAgents:
			return enableAgents(params, verbAppDelegate)
		case .requestToFront:
			return requestToFront(params, verbAppDelegate)
		case .isRuntime:
			return VerbResult.verbFalse
		case .countThreads:
			return countThreads(params, verbAppDelegate)
		case .isPowerPC:
			return VerbResult.verbFalse
		case .reclaimMemory:
			return VerbResult.noLongerImplemented
		case .version:
			return version(params, verbAppDelegate)
		case .hashStats:
			return hashStats(params, verbAppDelegate)
		case .getHashloopCount:
			return getHashloopCount(params, verbAppDelegate)
		case .hideApplication:
			return hideApplication(params, verbAppDelegate)
		case .isValidSerialNumber:
			return VerbResult.noLongerImplemented
		case .showApplication:
			return showApplication(params, verbAppDelegate)
		}
	}
}

private extension FrontierVerbs {
	
	static func getProgramPath(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func getFilePath(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func enableAgents(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func requestToFront(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func countThreads(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func version(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func hashStats(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getHashloopCount(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		// I have to wonder what in the hell this was. I don’t remember ever seeing it before. (Well, obviously I’ll look in the original code and figure it out. Hoping to do a VerbResult.noLongerImplemented here.)
		
		return VerbResult.notImplemented
	}
	
	static func hideApplication(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func showApplication(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
