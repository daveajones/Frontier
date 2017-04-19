//
//  DialogVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct DLLVerbs: VerbTable {
	
	private enum Verb: String {
		case call = "call"
		case load = "load"
		case unload = "unload"
		case isLoaded = "isloaded"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .call:
			return call(params)
		case .load:
			return load(params)
		case .unload:
			return unload(params)
		case .isLoaded:
			return isLoaded(params)
		}
	}
}

private extension DLLVerbs {
	
	static func call(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func load(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func unload(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func isLoaded(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
