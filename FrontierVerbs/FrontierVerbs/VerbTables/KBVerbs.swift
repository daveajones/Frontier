//
//  KBVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct KBVerbs: VerbTable {
	
	private enum Verb: String {
		case optionKey = "optionkey"
		case cmdKey = "cmdkey"
		case shiftKey = "shiftkey"
		case controlKey = "controlkey"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .optionKey:
			return isOptionKeyDown(params)
		case .cmdKey:
			return isCmdKeyDown(params)
		case .shiftKey:
			return isShiftKeyDown(params)
		case .controlKey:
			return isControlKeyDown(params)
		}
	}
}

private extension KBVerbs {
	
	static func isOptionKeyDown(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func isCmdKeyDown(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func isShiftKeyDown(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func isControlKeyDown(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
