//
//  FileVerbs.swift
//  FrontierVerbs
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa
import FrontierData

struct FileVerbs: VerbTable {
	
	private enum Verb: String {
		case x = "x"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .x:
				return try x(params)
			}
		}
		catch { throw error }
	}
}

private extension FileVerbs {
	
	static func x(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
