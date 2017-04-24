//
//  EditMenuVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct EditMenuVerbs: VerbTable {
	
	private enum Verb: String {
		case undo = "undo"
		case cut = "cut"
		case copy = "copy"
		case paste = "paste"
		case clear = "clear"
		case selectAll = "selectall"
		case getFont = "getfont"
		case getFontSize = "getfontsize"
		case setFont = "setfont"
		case setFontSize = "setfontsize"
		case plainText = "plaintext"
		case setBold = "setbold"
		case setItalic = "setitalic"
		case setUnderline = "setunderline"
		case setOutline = "setoutline"
		case setShadow = "setshadow"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .undo:
				return try undo(params)
			case .cut:
				return try cut(params)
			case .copy:
				return try copy(params)
			case .paste:
				return try paste(params)
			case .clear:
				return try clear(params)
			case .selectAll:
				return try selectAll(params)
			case .getFont:
				return try getFont(params)
			case .getFontSize:
				return try getFontSize(params)
			case .setFont:
				return try setFont(params)
			case .setFontSize:
				return try setFontSize(params)
			case .plainText:
				return try plainText(params)
			case .setBold:
				return try setBold(params)
			case .setItalic:
				return try setItalic(params)
			case .setUnderline:
				return try setUnderline(params)
			case .setOutline:
				return try setOutline(params)
			case .setShadow:
				return try setShadow(params)
			}
		}
		catch { throw error }
	}
}

private extension EditMenuVerbs {
	
	static func undo(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func cut(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func copy(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func paste(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func clear(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func selectAll(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getFont(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getFontSize(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setFont(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setFontSize(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func plainText(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setBold(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setItalic(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setUnderline(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setOutline(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setShadow(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
