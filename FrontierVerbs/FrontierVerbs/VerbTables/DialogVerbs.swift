//
//  DialogVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .alert:
			return alert(params)
		case .run:
			return run(params)
		case .runModeless:
			return runModeless(params)
		case .runCard:
			return runCard(params)
		case .runModalCard:
			return runModalCard(params)
		case .isModalCard:
			return isModalCard(params)
		case .setModalCardTimeout:
			return setModalCardTimeout(params)
		case .getValue:
			return getValue(params)
		case .setValue:
			return setValue(params)
		case .setItemEnable:
			return setItemEnable(params)
		case .showItem:
			return showItem(params)
		case .hideItem:
			return hideItem(params)
		case .twoWay:
			return twoWay(params)
		case .threeWay:
			return threeWay(params)
		case .ask:
			return ask(params)
		case .getInt:
			return getInt(params)
		case .notify:
			return notify(params)
		case .getUserInfo:
			return getUserInfo(params)
		case .getPassword:
			return getPassword(params)
		}
	}
}

private extension DialogVerbs {
	
	static func alert(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func run(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func runModeless(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func runCard(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func runModalCard(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func isModalCard(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setModalCardTimeout(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setValue(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setItemEnable(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func showItem(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func hideItem(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func twoWay(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func threeWay(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func ask(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getInt(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func notify(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getUserInfo(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getPassword(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	

}
