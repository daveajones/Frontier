//
//  ClipboardVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct ClipboardVerbs: VerbTable {
	
	private enum Verb: String {
		case get = "get"
		case put = "put"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {			
			switch verb {
			case .get:
				return try get(params)
			case .put:
				return try put(params)
			}
		}
		catch { throw error }
	}
}

private extension ClipboardVerbs {
	
	static func get(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func put(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
