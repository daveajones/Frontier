//
//  DialogVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct DLLVerbs: VerbTable {
	
	private enum Verb: String {
		case call = "call"
		case load = "load"
		case unload = "unload"
		case isLoaded = "isloaded"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .call:
				return try call(params)
			case .load:
				return try load(params)
			case .unload:
				return try unload(params)
			case .isLoaded:
				return try isLoaded(params)
			}
		}
		catch { throw error }
	}
}

private extension DLLVerbs {
	
	static func call(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func load(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func unload(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func isLoaded(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
