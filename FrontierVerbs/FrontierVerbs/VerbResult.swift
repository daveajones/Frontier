//
//  VerbResult.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

enum VerbError: Error {
	case verbNotFound
	case tooManyParams
	case tooFewParams
	case notImplemented
	case noLongerImplemented
}

struct VerbResult {

	static let empty = VerbResult(value: nil, error: nil)
	static let verbNotFound = VerbResult(error: .verbNotFound)
	static let tooManyParams = VerbResult(error: .tooManyParams)
	static let tooFewParams = VerbResult(error: .tooFewParams)
	static let notImplemented = VerbResult(error: .notImplemented)
	static let noLongerImplemented = VerbResult(error: .noLongerImplemented)
	
	let value: Any?
	let error: Error?
	
	init(value: Any) {
		
		self.init(value: value, error: nil)
	}

	init(error: VerbError) {
		
		self.init(value: nil, error: error)
	}
	
	init(value: Any?, error: VerbError?) {
		
		self.value = value
		self.error = error
	}
}
