//
//  BitVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation


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

	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .clear:
			return clear(params)
		case .get:
			return get(params)
		case .logicalAnd:
			return logicalAnd(params)
		case .logicalOr:
			return logicalOr(params)
		case .logicalXor:
			return logicalXor(params)
		case .set:
			return set(params)
		case .shiftLeft:
			return shiftLeft(params)
		case .shiftRight:
			return shiftRight(params)
		}
	}
}

private extension BitVerbs {
	
	static func clear(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func get(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func logicalAnd(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func logicalOr(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func logicalXor(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func set(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func shiftLeft(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func shiftRight(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}



