//
//  BitVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData


struct Base64Verbs: VerbTable {
	
	private enum Verb: String {
		case decode = "decode"
		case encode = "encode"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {				
			case .decode:
				return try decode(params)
			case .encode:
				return try encode(params)
			}
		}
		catch { throw error }
	}
}

private extension Base64Verbs {
	
	static func decode(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func encode(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}



