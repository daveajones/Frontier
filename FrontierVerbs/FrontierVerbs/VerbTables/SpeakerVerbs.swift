//
//  SpeakerVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct SpeakerVerbs: VerbTable {
	
	private enum Verb: String {
		case x = "x"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .x:
			return x(params)
		}
	}
}

private extension SpeakerVerbs {
	
	static func x(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
