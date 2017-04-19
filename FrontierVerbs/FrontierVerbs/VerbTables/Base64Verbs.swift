//
//  BitVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation


struct Base64Verbs: VerbTable {
	
	private enum Verb: String {
		case decode = "decode"
		case encode = "encode"
	}

	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .decode:
			return decode(params)
		case .encode:
			return encode(params)
		}
	}
}

private extension Base64Verbs {
	
	static func decode(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func encode(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}



