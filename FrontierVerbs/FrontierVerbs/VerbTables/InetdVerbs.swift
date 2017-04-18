//
//  InetdVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct InetdVerbs: VerbTable {
	
	private enum Verb: String {
		case supervisor = "supervisor"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .supervisor:
			return supervisor(params)
		}
	}
}

private extension InetdVerbs {
	
	static func supervisor(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
