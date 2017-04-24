//
//  MathVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct MathVerbs: VerbTable {
	
	private enum Verb: String {
		case min = "min"
		case max = "max"
		case sqrt = "sqrt"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .min:
				return try mathMin(params)
			case .max:
				return try mathMax(params)
			case .sqrt:
				return try mathSqrt(params)
			}
		}
		catch { throw error }
	}
}

private extension MathVerbs {
	
	static func compareValues<T:Comparable>(_ v1: T, _ v2: T) -> ComparisonResult {
		
		if v1 == v2 {
			return .orderedSame
		}
		return v1 < v2 ? .orderedAscending : .orderedDescending
	}
	
	static func compareTwoValues(_ value1: Value, _ value2: Value) throws -> ComparisonResult {
		
		let coercionType = value1.commonCoercionType(with: value2)
		
		switch coercionType {
			
		case .none:
			return .orderedSame
			
		case .bool, .char, .int, .direction:
			return compareValues(value1.asInt!, value2.asInt!)
			
		case .date, .double:
			return compareValues(value1.asDouble!, value2.asDouble!)
			
		case .string:
			return compareValues(value1.asString!, value2.asString!)
			
		default:
			throw LangError(.coercionNotPossible)
		}
	}
	
	static func mathMin(_ params: VerbParams) throws -> Value {
		
		do {
			let (value1, value2) = try params.binaryParams()
			let comparisonResult = try compareTwoValues(value1, value2)
			
			if comparisonResult == .orderedSame || comparisonResult == .orderedAscending {
				return value1
			}
			return value2
		}
		catch { throw error }
	}
	
	static func mathMax(_ params: VerbParams) throws -> Value {
		
		do {
			let (value1, value2) = try params.binaryParams()
			let comparisonResult = try compareTwoValues(value1, value2)
			
			if comparisonResult == .orderedAscending {
				return value2
			}
			return value1
		}
		catch { throw error }
	}
	
	static func mathSqrt(_ params: VerbParams) throws -> Value {
		
		do {
			let value = try params.singleParam()
			guard let d = value.asDouble else {
				throw LangError(.coercionNotPossible)
			}
			return sqrt(d)
		}
		catch { throw error }
	}
}
