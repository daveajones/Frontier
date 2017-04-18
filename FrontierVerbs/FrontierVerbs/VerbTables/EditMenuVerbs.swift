//
//  EditMenuVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .undo:
			return undo(params)
		case .cut:
			return cut(params)
		case .copy:
			return copy(params)
		case .paste:
			return paste(params)
		case .clear:
			return clear(params)
		case .selectAll:
			return selectAll(params)
		case .getFont:
			return getFont(params)
		case .getFontSize:
			return getFontSize(params)
		case .setFont:
			return setFont(params)
		case .setFontSize:
			return setFontSize(params)
		case .plainText:
			return plainText(params)
		case .setBold:
			return setBold(params)
		case .setItalic:
			return setItalic(params)
		case .setUnderline:
			return setUnderline(params)
		case .setOutline:
			return setOutline(params)
		case .setShadow:
			return setShadow(params)
		}
	}
}

private extension EditMenuVerbs {
	
	static func undo(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func cut(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func copy(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func paste(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func clear(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func selectAll(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getFont(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getFontSize(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setFont(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setFontSize(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func plainText(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setBold(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setItalic(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setUnderline(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setOutline(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setShadow(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
