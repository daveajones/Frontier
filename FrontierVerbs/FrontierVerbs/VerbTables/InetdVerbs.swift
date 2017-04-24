//
//  InetdVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct InetdVerbs: VerbTable {
	
	private enum Verb: String {
		case supervisor = "supervisor"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .supervisor:
				return try supervisor(params)
			}
		}
		catch { throw error }
	}
}

private extension InetdVerbs {
	
	static func supervisor(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
