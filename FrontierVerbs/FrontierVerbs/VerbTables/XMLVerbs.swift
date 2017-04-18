//
//  XMLVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .addTable:
			return addTable(params)
		case .addValue:
			return addValue(params)
		case .compile:
			return compile(params)
		case .deCompile:
			return deCompile(params)
		case .getAddress:
			return getAddress(params)
		case .getAddressList:
			return getAddressList(params)
		case .getAttribute:
			return getAttribute(params)
		case .getAttributeValue:
			return getAttributeValue(params)
		case .getValue:
			return getValue(params)
		case .valToString:
			return valToString(params)
		case .frontierValueToTaggedText:
			return frontierValueToTaggedText(params)
		case .structToFrontierValue:
			return structToFrontierValue(params)
		case .getPathAddress:
			return getPathAddress(params)
		case .convertToDisplayName:
			return convertToDisplayName(params)
		}
	}
}

private extension XMLVerbs {
	
	static func addTable(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func addValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func compile(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func deCompile(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getAddress(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getAddressList(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getAttribute(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getAttributeValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func valToString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func frontierValueToTaggedText(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func structToFrontierValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getPathAddress(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func convertToDisplayName(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	

}
