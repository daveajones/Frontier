//
//  ClockVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct ClockVerbs: VerbTable {
	
	private enum Verb: String {
		case now = "now"
		case sleepFor = "sleepFor"
		case ticks = "ticks"
		case milliseconds = "milliseconds"
		case waitSeconds = "waitseconds"
		case waitSixtieths = "waitsixtieths"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .now:
				return try now(params)
			case .sleepFor:
				return try sleepFor(params)
			case .ticks:
				return try ticks(params)
			case .milliseconds:
				return try milliseconds(params)
			case .waitSeconds:
				return try waitSeconds(params)
			case .waitSixtieths:
				return try waitSixtieths(params)
			}
		}
		catch { throw error }
	}
}

private extension ClockVerbs {
	
	static func now(_ params: VerbParams) throws -> Value {
		
		do {
			try params.throwParamCountErrorIfNeeded(0)
		}
		catch { throw error }
		
		throw LangError(.unimplementedVerb)
	}
	
	static func sleepFor(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func ticks(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func milliseconds(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func waitSeconds(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func waitSixtieths(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
