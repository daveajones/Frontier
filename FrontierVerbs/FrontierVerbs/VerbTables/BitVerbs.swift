//
//  BitVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData


struct BitVerbs: VerbTable {
	
	private enum Verb: String {
		case clear = "clear"
		case get = "get"
		case logicalAnd = "logicaland"
		case logicalOr = "logicalor"
		case logicalXor = "logicalxor"
		case set = "set"
		case shiftLeft = "shiftleft"
		case shiftRight = "shiftright"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .clear:
				return try clear(params)
			case .get:
				return try get(params)
			case .logicalAnd:
				return try logicalAnd(params)
			case .logicalOr:
				return try logicalOr(params)
			case .logicalXor:
				return try logicalXor(params)
			case .set:
				return try set(params)
			case .shiftLeft:
				return try shiftLeft(params)
			case .shiftRight:
				return try shiftRight(params)
			}
		}
		catch { throw error }
	}
}

private extension BitVerbs {
	
	static func clear(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func get(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func logicalAnd(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func logicalOr(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func logicalXor(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func set(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func shiftLeft(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func shiftRight(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}



