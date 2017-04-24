//
//  HTMLVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .processMacros:
				return try processMacros(params)
			case .urlDecode:
				return try urlDecode(params)
			case .urlEncode:
				return try urlEncode(params)
			case .parseHTTPArgs:
				return try parseHTTPArgs(params)
			case .iso8859Encode:
				return try iso8859Encode(params)
			case .getGIFHeightWidth:
				return try getGIFHeightWidth(params)
			case .getJPEGHeightWidth:
				return try getJPEGHeightWidth(params)
			case .buildPageTable:
				return try buildPageTable(params)
			case .refGlossary:
				return try refGlossary(params)
			case .getPref:
				return try getPref(params)
			case .getOneDirective:
				return try getOneDirective(params)
			case .runDirective:
				return try runDirective(params)
			case .runDirectives:
				return try runDirectives(params)
			case .runOutlineDirectives:
				return try runOutlineDirectives(params)
			case .cleanForExport:
				return try cleanForExport(params)
			case .normalizeName:
				return try normalizeName(params)
			case .glossaryPatcher:
				return try glossaryPatcher(params)
			case .expandURLs:
				return try expandURLs(params)
			case .traversalSkip:
				return try traversalSkip(params)
			case .getPageTableAddress:
				return try getPageTableAddress(params)
			case .neuterMacros:
				return try neuterMacros(params)
			case .neuterTags:
				return try neuterTags(params)
			case .drawCalendar:
				return try drawCalendar(params)
			}
		}
		catch { throw error }
	}
}

private extension HTMLVerbs {
	
	static func processMacros(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func urlDecode(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func urlEncode(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func parseHTTPArgs(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func iso8859Encode(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getGIFHeightWidth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getJPEGHeightWidth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func buildPageTable(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func refGlossary(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getPref(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getOneDirective(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func runDirective(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func runDirectives(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func runOutlineDirectives(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func cleanForExport(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func normalizeName(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func glossaryPatcher(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func expandURLs(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func traversalSkip(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getPageTableAddress(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func neuterMacros(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func neuterTags(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func drawCalendar(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
}
