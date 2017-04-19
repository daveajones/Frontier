//
//  SearchVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct SearchVerbs: VerbTable {
	
	private enum Verb: String {
		case reset = "reset"
		case findNext = "findnext"
		case replace = "replace"
		case replaceAll = "replaceall"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .reset:
			return reset(params)
		case .findNext:
			return findNext(params)
		case .replace:
			return replace(params)
		case .replaceAll:
			return replaceAll(params)
		}
	}
}

private extension SearchVerbs {
	
	static func reset(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func findNext(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func replace(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func replaceAll(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	

}
