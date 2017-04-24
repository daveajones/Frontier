//
//  VerbParameters.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa
import FrontierData

struct VerbParams {

	let ordered: [Value]
	let named: [String: Value]
	let count: Int
	
	init(ordered: [Value], named: [String: Value]) {
		
		self.ordered = ordered
		self.named = named
		self.count = ordered.count
	}
	
	// MARK: Common Cases
	
	func singleParam() throws -> Value {
	
		guard count == 1 else {
			throw paramCountError(1)
		}
		return ordered[0]
	}
	
	func binaryParams() throws -> (Value, Value) {
		
		guard count == 2 else {
			throw paramCountError(2)
		}
		return (ordered[0], ordered[1])
	}
	
	func trinaryParams() throws -> (Value, Value, Value) {
		
		guard count == 3 else {
			throw paramCountError(3)
		}
		return (ordered[0], ordered[1], ordered[2])
	}
	
	// MARK: Errors
	
	func paramCountError(_ expected: Int) -> LangError {
		
		assert(expected != count)
		
		if expected < count {
			return LangError(.notEnoughParameters)
		}
		return LangError(.tooManyParameters)
	}
	
	func throwParamCountErrorIfNeeded(_ expected: Int) throws {
		
		if expected != count {
			throw paramCountError(expected)
		}
	}
}

