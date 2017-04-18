//
//  OSAVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct OSAVerbs: VerbTable {
	
	private enum Verb: String {
		case compile = "compile"
		case getSource = "getsource"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .compile:
			return compile(params)
		case .getSource:
			return getSource(params)
		}
	}
}

private extension OSAVerbs {
	
	static func compile(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getSource(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
