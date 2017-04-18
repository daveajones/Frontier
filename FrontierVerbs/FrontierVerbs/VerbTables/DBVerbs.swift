//
//  DBVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .new:
			return new(params)
		case .open:
			return open(params)
		case .save:
			return save(params)
		case .close:
			return close(params)
		case .defined:
			return defined(params)
		case .getValue:
			return getValue(params)
		case .setValue:
			return setValue(params)
		case .delete:
			return delete(params)
		case .newTable:
			return newTable(params)
		case .isTable:
			return isTable(params)
		case .countItems:
			return countItems(params)
		case .getNthItem:
			return getNthItem(params)
		case .getModDate:
			return getModDate(params)
		}
	}
}

private extension DBVerbs {
	
	static func new(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func open(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func save(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func close(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func defined(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func delete(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func newTable(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func isTable(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func countItems(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getNthItem(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getModDate(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
