//
//  KBVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct KBVerbs: VerbTable {
	
	private enum Verb: String {
		case optionKey = "optionkey"
		case cmdKey = "cmdkey"
		case shiftKey = "shiftkey"
		case controlKey = "controlkey"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .optionKey:
				return try isOptionKeyDown(params)
			case .cmdKey:
				return try isCmdKeyDown(params)
			case .shiftKey:
				return try isShiftKeyDown(params)
			case .controlKey:
				return try isControlKeyDown(params)
			}
		}
		catch { throw error }
	}
}

private extension KBVerbs {
	
	static func isOptionKeyDown(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func isCmdKeyDown(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func isShiftKeyDown(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func isControlKeyDown(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
