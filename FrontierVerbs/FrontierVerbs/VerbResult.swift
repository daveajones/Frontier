//
//  VerbResult.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct VerbResult {

	static let empty = VerbResult(value: nil, error: nil)
	static let verbNotFound = VerbResult(error: LangError(.verbNotFound))
	static let tooManyParams = VerbResult(error: LangError(.tooManyParameters))
	static let tooFewParams = VerbResult(error: LangError(.notEnoughParameters))
	static let notImplemented = VerbResult(error: LangError(.unimplementedVerb))
	static let noLongerImplemented = VerbResult(error: LangError(.noLongerImplemented))
	static let verbTrue = VerbResult(true)
	static let verbFalse = VerbResult(false)
	static let verbNil = VerbResult(NSNull())
	
	let value: Value?
	let error: LangError?
	
	init(_ value: Value) {
		
		self.init(value: value, error: nil)
	}

	init(error: LangError) {
		
		self.init(value: nil, error: error)
	}
	
	init(value: Value?, error: LangError?) {
		
		self.value = value
		self.error = error
	}
	
	static func paramCountError(_ numberOfParams: Int, expected: Int) -> VerbResult? {
		if numberOfParams == expected {
			return nil
		}
		if numberOfParams < expected {
			return VerbResult.tooFewParams
		}
		return VerbResult.tooManyParams
	}
}
