//
//  LaunchVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct LaunchVerbs: VerbTable {
	
	private enum Verb: String {
		case appleMenu = "appleMenu"
		case application = "application"
		case appWithDocument = "appwithdocument"
		case resource = "resource"
		case anything = "anything"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .appleMenu:
				return false
			case .application:
				return try launchApplication(params)
			case .appWithDocument:
				return try launchAppWithDocument(params)
			case .resource:
				return false
			case .anything:
				return try launchAnything(params)
			}
		}
		catch { throw error }
	}
}

private extension LaunchVerbs {
	
	static func launchApplication(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func launchAppWithDocument(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func launchAnything(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
