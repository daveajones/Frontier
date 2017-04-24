//
//  DBVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct DBVerbs: VerbTable {
	
	private enum Verb: String {
		case new = "new"
		case open = "open"
		case save = "save"
		case close = "close"
		case defined = "defined"
		case getValue = "getvalue"
		case setValue = "setvalue"
		case delete = "delete"
		case newTable = "newtable"
		case isTable = "istable"
		case countItems = "countitems"
		case getNthItem = "getnthitem"
		case getModDate = "getmoddate"
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
			case .save:
				return try save(params)
			case .close:
				return try close(params)
			case .defined:
				return try defined(params)
			case .getValue:
				return try getValue(params)
			case .setValue:
				return try setValue(params)
			case .delete:
				return try delete(params)
			case .newTable:
				return try newTable(params)
			case .isTable:
				return try isTable(params)
			case .countItems:
				return try countItems(params)
			case .getNthItem:
				return try getNthItem(params)
			case .getModDate:
				return try getModDate(params)
			}
		}
		catch { throw error }
	}
}

private extension DBVerbs {
	
	static func new(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func open(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func save(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func close(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func defined(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func delete(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func newTable(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func isTable(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func countItems(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getNthItem(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getModDate(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
