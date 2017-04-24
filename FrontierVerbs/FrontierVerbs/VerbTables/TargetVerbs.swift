//
//  TargetVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct TargetVerbs: VerbTable {
	
	private enum Verb: String {
		case get = "get"
		case set = "set"
		case clear = "clear"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .get:
				return try get(params)
			case .set:
				return try set(params)
			case .clear:
				return try clear(params)
			}
		}
		catch { throw error }
	}
}

private extension TargetVerbs {
	
	// TODO: use main thread queue
	
	static func get(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func set(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func clear(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
