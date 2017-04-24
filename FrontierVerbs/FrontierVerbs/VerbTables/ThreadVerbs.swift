//
//  ThreadVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .exists:
				return try exists(params)
			case .evaluate:
				return try evaluate(params)
			case .callScript:
				return try callScript(params)
			case .getCurrentID:
				return try getCurrentID(params)
			case .getCount:
				return try getCount(params)
			case .getNthID:
				return try getNthID(params)
			case .sleep:
				return try sleep(params)
			case .sleepFor:
				return try sleepFor(params)
			case .sleepTicks:
				return try sleepTicks(params)
			case .isSleeping:
				return try isSleeping(params)
			case .wake:
				return try wake(params)
			case .kill:
				return try kill(params)
			case .getTimeSlice:
				return 0
			case .setTimeSlice:
				return false
			case .getDefaultTimeSlice:
				return 0
			case .setDefaultTimeSlice:
				return false
			case .getStats:
				return try getStats(params)
			}
		}
		catch { throw error }
	}
}

private extension ThreadVerbs {
	
	static func exists(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func evaluate(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func callScript(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getCurrentID(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getCount(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getNthID(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func sleep(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func sleepFor(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func sleepTicks(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func isSleeping(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func wake(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func kill(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getStats(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
