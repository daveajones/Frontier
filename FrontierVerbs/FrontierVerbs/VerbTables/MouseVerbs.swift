//
//  MouseVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct MouseVerbs: VerbTable {
	
	private enum Verb: String {
		case button = "button"
		case location = "location"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .button:
				return try button(params)
			case .location:
				return try location(params)
			}
		}
		catch { throw error }
	}
}

private extension MouseVerbs {
	
	static func button(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func location(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
