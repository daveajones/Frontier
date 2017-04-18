//
//  ClipboardVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct ClipboardVerbs: VerbTable {
	
	private enum Verb: String {
		case get = "get"
		case put = "put"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .get:
			return get(params)
		case .put:
			return put(params)
		}
	}
}

private extension ClipboardVerbs {
	
	static func get(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func put(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
