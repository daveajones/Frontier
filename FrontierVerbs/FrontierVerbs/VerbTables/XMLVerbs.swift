//
//  XMLVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

// Notes:
// Original Frontier has its own XML parser.
// Instead we should build on the libxml2 SAX parser.
// RancheroXML.framework should be copied and renamed and added to this workspace.

struct XMLVerbs: VerbTable {
	
	private enum Verb: String {
		case addTable = "addtable"
		case addValue = "addValue"
		case compile = "compile"
		case deCompile = "decompile"
		case getAddress = "getaddress"
		case getAddressList = "getaddresslist"
		case getAttribute = "getattribute"
		case getAttributeValue = "getattributevalue"
		case getValue = "getvalue"
		case valToString = "valtostring"
		case frontierValueToTaggedText = "frontiervaluetotaggedtext"
		case structToFrontierValue = "structtofrontiervalue"
		case getPathAddress = "getpathaddress"
		case convertToDisplayName = "converttodisplayname"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .addTable:
				return try addTable(params)
			case .addValue:
				return try addValue(params)
			case .compile:
				return try compile(params)
			case .deCompile:
				return try deCompile(params)
			case .getAddress:
				return try getAddress(params)
			case .getAddressList:
				return try getAddressList(params)
			case .getAttribute:
				return try getAttribute(params)
			case .getAttributeValue:
				return try getAttributeValue(params)
			case .getValue:
				return try getValue(params)
			case .valToString:
				return try valToString(params)
			case .frontierValueToTaggedText:
				return try frontierValueToTaggedText(params)
			case .structToFrontierValue:
				return try structToFrontierValue(params)
			case .getPathAddress:
				return try getPathAddress(params)
			case .convertToDisplayName:
				return try convertToDisplayName(params)
			}
		}
		catch { throw error }
	}
}

private extension XMLVerbs {
	
	static func addTable(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func addValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func compile(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func deCompile(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getAddress(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getAddressList(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getAttribute(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getAttributeValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func valToString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func frontierValueToTaggedText(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func structToFrontierValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getPathAddress(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func convertToDisplayName(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	
}
