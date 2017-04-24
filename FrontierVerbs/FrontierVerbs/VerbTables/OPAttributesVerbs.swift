//
//  OPAttributesVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct OPAttributesVerbs: VerbTable {
	
	private enum Verb: String {
		case addGroup = "addgroup"
		case getAll = "getall"
		case getOne = "getone"
		case makeEmpty = "makeempty"
		case setOne = "setone"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .addGroup:
				return try addGroup(params)
			case .getAll:
				return try getAll(params)
			case .getOne:
				return try getOne(params)
			case .makeEmpty:
				return try makeEmpty(params)
			case .setOne:
				return try setOne(params)
			}
		}
		catch { throw error }
	}
}

private extension OPAttributesVerbs {
	
	static func addGroup(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getAll(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getOne(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func makeEmpty(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setOne(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
