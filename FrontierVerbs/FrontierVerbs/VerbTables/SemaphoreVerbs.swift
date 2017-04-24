//
//  SemaphoreVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct SemaphoreVerbs: VerbTable {
	
	private enum Verb: String {
		case lock = "lock"
		case unlock = "unlock"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .lock:
				return try lock(params)
			case .unlock:
				return try unlock(params)
			}
		}
		catch { throw error }
	}
}

private extension SemaphoreVerbs {
	
	static func lock(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func unlock(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
