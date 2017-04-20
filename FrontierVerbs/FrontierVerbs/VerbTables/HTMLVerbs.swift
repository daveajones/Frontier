//
//  HTMLVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct HTMLVerbs: VerbTable {
	
	private enum Verb: String {
		case processMacros = "processmacros"
		case urlDecode = "urldecode"
		case urlEncode = "urlEncode"
		case parseHTTPArgs = "parseHTTPArgs"
		case iso8859Encode = "iso8859encode"
		case getGIFHeightWidth = "getgifheightwidth"
		case getJPEGHeightWidth = "getjpegheightwidth"
		case buildPageTable = "buildpagetable"
		case refGlossary = "refglossary"
		case getPref = "getpref"
		case getOneDirective = "getonedirective"
		case runDirective = "rundirective"
		case runDirectives = "rundirectives"
		case runOutlineDirectives = "runoutlinedirectives"
		case cleanForExport = "cleanforexport"
		case normalizeName = "normalizename"
		case glossaryPatcher = "glossarypatcher"
		case expandURLs = "expandurls"
		case traversalSkip = "traversalskip"
		case getPageTableAddress = "getpagetableaddress"
		case neuterMacros = "neutermacros"
		case neuterTags = "neutertags"
		case drawCalendar = "drawcalendar"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .processMacros:
			return processMacros(params)
		case .urlDecode:
			return urlDecode(params)
		case .urlEncode:
			return urlEncode(params)
		case .parseHTTPArgs:
			return parseHTTPArgs(params)
		case .iso8859Encode:
			return iso8859Encode(params)
		case .getGIFHeightWidth:
			return getGIFHeightWidth(params)
		case .getJPEGHeightWidth:
			return getJPEGHeightWidth(params)
		case .buildPageTable:
			return buildPageTable(params)
		case .refGlossary:
			return refGlossary(params)
		case .getPref:
			return getPref(params)
		case .getOneDirective:
			return getOneDirective(params)
		case .runDirective:
			return runDirective(params)
		case .runDirectives:
			return runDirectives(params)
		case .runOutlineDirectives:
			return runOutlineDirectives(params)
		case .cleanForExport:
			return cleanForExport(params)
		case .normalizeName:
			return normalizeName(params)
		case .glossaryPatcher:
			return glossaryPatcher(params)
		case .expandURLs:
			return expandURLs(params)
		case .traversalSkip:
			return traversalSkip(params)
		case .getPageTableAddress:
			return getPageTableAddress(params)
		case .neuterMacros:
			return neuterMacros(params)
		case .neuterTags:
			return neuterTags(params)
		case .drawCalendar:
			return drawCalendar(params)
		}
	}
}

private extension HTMLVerbs {
	
	static func processMacros(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func urlDecode(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func urlEncode(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func parseHTTPArgs(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func iso8859Encode(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getGIFHeightWidth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getJPEGHeightWidth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func buildPageTable(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func refGlossary(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getPref(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getOneDirective(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func runDirective(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func runDirectives(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func runOutlineDirectives(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func cleanForExport(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func normalizeName(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func glossaryPatcher(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func expandURLs(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func traversalSkip(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getPageTableAddress(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func neuterMacros(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func neuterTags(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func drawCalendar(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
}
