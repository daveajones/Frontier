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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .min:
			return mathMin(params)
		case .max:
			return mathMax(params)
		case .sqrt:
			return mathSqrt(params)
		}
	}
}

private extension MathVerbs {
	
	static func compareValues<T:Comparable>(_ v1: T, _ v2: T) -> ComparisonResult {
		
		if v1 == v2 {
			return .orderedSame
		}
		return v1 < v2 ? .orderedAscending : .orderedDescending
	}
	
	static func compareTwoValues(_ value1: Value, _ value2: Value) -> ComparisonResult? {
		
		guard let coercionType = value1.commonCoercionType(with: value2) else {
			return nil
		}
		
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
			return nil
		}
	}
	
	static func mathMin(_ params: VerbParams) -> VerbResult {
		
		guard let (value1, value2) = params.binaryParams else {
			return VerbResult.paramCountError(params.count, expected: 2)!
		}
		
		if let comparisonResult = compareTwoValues(value1, value2) {
			if comparisonResult == .orderedSame || comparisonResult == .orderedAscending {
				return VerbResult(value1)
			}
			return VerbResult(value2)
		}
		return VerbResult(value1) // TODO: coercion error instead
	}
	
	static func mathMax(_ params: VerbParams) -> VerbResult {
		
		guard let (value1, value2) = params.binaryParams else {
			return VerbResult.paramCountError(params.count, expected: 2)!
		}
		
		if let comparisonResult = compareTwoValues(value1, value2) {
			if comparisonResult == .orderedSame || comparisonResult == .orderedDescending {
				return VerbResult(value1)
			}
			return VerbResult(value2)
		}
		return VerbResult(value1) // TODO: coercion error instead
	}
	
	static func mathSqrt(_ params: VerbParams) -> VerbResult {
		
		guard let value = params.singleParam else {
			return VerbResult.paramCountError(params.count, expected: 1)!
		}
		
		guard let d = value.asDouble else {
			return VerbResult(error: LangError(.coercionNotPossible))
		}
		
		return VerbResult(sqrt(d))
	}
}
