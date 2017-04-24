//
//  SearchVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct SearchVerbs: VerbTable {
	
	private enum Verb: String {
		case reset = "reset"
		case findNext = "findnext"
		case replace = "replace"
		case replaceAll = "replaceall"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .reset:
				return try reset(params)
			case .findNext:
				return try findNext(params)
			case .replace:
				return try replace(params)
			case .replaceAll:
				return try replaceAll(params)
			}
		}
		catch { throw error }
	}
}

private extension SearchVerbs {
	
	static func reset(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func findNext(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func replace(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func replaceAll(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	
}
