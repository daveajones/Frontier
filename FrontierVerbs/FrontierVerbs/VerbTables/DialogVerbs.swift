//
//  DialogVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct DialogVerbs: VerbTable {
	
	private enum Verb: String {
		case alert = "alert"
		case run = "run"
		case runModeless = "runmodeless"
		case runCard = "runcard"
		case runModalCard = "runmodalcard"
		case isModalCard = "ismodalcard"
		case setModalCardTimeout = "setmodalcardtimeout"
		case getValue = "getvalue"
		case setValue = "setvalue"
		case setItemEnable = "setitemenable"
		case showItem = "showitem"
		case hideItem = "hideitem"
		case twoWay = "twoway"
		case threeWay = "threeway"
		case ask = "ask"
		case getInt = "getint"
		case notify = "notify"
		case getUserInfo = "getuserinfo"
		case getPassword = "getpassword"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .alert:
				return try alert(params)
			case .run:
				return try run(params)
			case .runModeless:
				return try runModeless(params)
			case .runCard:
				return try runCard(params)
			case .runModalCard:
				return try runModalCard(params)
			case .isModalCard:
				return try isModalCard(params)
			case .setModalCardTimeout:
				return try setModalCardTimeout(params)
			case .getValue:
				return try getValue(params)
			case .setValue:
				return try setValue(params)
			case .setItemEnable:
				return try setItemEnable(params)
			case .showItem:
				return try showItem(params)
			case .hideItem:
				return try hideItem(params)
			case .twoWay:
				return try twoWay(params)
			case .threeWay:
				return try threeWay(params)
			case .ask:
				return try ask(params)
			case .getInt:
				return try getInt(params)
			case .notify:
				return try notify(params)
			case .getUserInfo:
				return try getUserInfo(params)
			case .getPassword:
				return try getPassword(params)
			}
		}
		catch { throw error }
	}
}

private extension DialogVerbs {
	
	static func alert(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func run(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func runModeless(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func runCard(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func runModalCard(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func isModalCard(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setModalCardTimeout(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setValue(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setItemEnable(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func showItem(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func hideItem(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func twoWay(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func threeWay(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func ask(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getInt(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func notify(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getUserInfo(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getPassword(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	
}
