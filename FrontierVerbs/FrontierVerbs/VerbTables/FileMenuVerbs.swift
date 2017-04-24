//
//  FileMenuVerbs.swift
//  FrontierVerbs
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct FileMenuVerbs: VerbTable {
	
	private enum Verb: String {
		case new = "new"
		case open = "open"
		case close = "close"
		case closeAll = "closeall"
		case save = "save"
		case saveCopy = "savecopy"
		case revert = "revert"
		case print = "print"
		case quit = "quit"
		case saveAs = "saveAs"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .new:
				return try new(params)
			case .open:
				return try open(params)
			case .close:
				return try close(params)
			case .closeAll:
				return try closeAll(params)
			case .save:
				return try save(params)
			case .saveCopy:
				return try saveCopy(params)
			case .revert:
				return try revert(params)
			case .print:
				throw LangError(.noLongerImplemented)
			case .quit:
				return try quit(params)
			case .saveAs:
				return try saveAs(params)
			}
		}
		catch { throw error }
	}
}

private extension FileMenuVerbs {
	
	static func new(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func open(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func close(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func closeAll(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func save(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func saveCopy(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func revert(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func quit(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func saveAs(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
