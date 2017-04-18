//
//  OPAttributesVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct OPAttributesVerbs: VerbTable {
	
	private enum Verb: String {
		case addGroup = "addgroup"
		case getAll = "getall"
		case getOne = "getone"
		case makeEmpty = "makeempty"
		case setOne = "setone"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .addGroup:
			return addGroup(params)
		case .getAll:
			return getAll(params)
		case .getOne:
			return getOne(params)
		case .makeEmpty:
			return makeEmpty(params)
		case .setOne:
			return setOne(params)
		}
	}
}

private extension OPAttributesVerbs {
	
	static func addGroup(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getAll(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getOne(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func makeEmpty(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setOne(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
