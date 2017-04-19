//
//  FileMenuVerbs.swift
//  FrontierVerbs
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .new:
			return new(params)
		case .open:
			return open(params)
		case .close:
			return close(params)
		case .closeAll:
			return closeAll(params)
		case .save:
			return save(params)
		case .saveCopy:
			return saveCopy(params)
		case .revert:
			return revert(params)
		case .print:
			return VerbResult.noLongerImplemented
		case .quit:
			return quit(params)
		case .saveAs:
			return saveAs(params)
		}
	}
}

private extension FileMenuVerbs {
	
	static func new(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func open(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func close(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func closeAll(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func save(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func saveCopy(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func revert(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func quit(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func saveAs(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
