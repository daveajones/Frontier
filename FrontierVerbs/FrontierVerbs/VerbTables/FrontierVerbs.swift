//
//  FrontierVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .getProgramPath:
				return try getProgramPath(params, verbAppDelegate)
			case .getFilePath:
				return try getFilePath(params, verbAppDelegate)
			case .enableAgents:
				return try enableAgents(params, verbAppDelegate)
			case .requestToFront:
				return try requestToFront(params, verbAppDelegate)
			case .isRuntime:
				return false
			case .countThreads:
				return try countThreads(params, verbAppDelegate)
			case .isPowerPC:
				return false
			case .reclaimMemory:
				return true
			case .version:
				return try version(params, verbAppDelegate)
			case .hashStats:
				return try hashStats(params, verbAppDelegate)
			case .getHashloopCount:
				return 0
			case .hideApplication:
				return try hideApplication(params, verbAppDelegate)
			case .isValidSerialNumber:
				return true
			case .showApplication:
				return try showApplication(params, verbAppDelegate)
			}
		}
		catch { throw error }
	}
}

private extension FrontierVerbs {
	
	static func getProgramPath(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getFilePath(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func enableAgents(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func requestToFront(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func countThreads(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func version(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func hashStats(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func hideApplication(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func showApplication(_ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
