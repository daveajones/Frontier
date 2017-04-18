//
//  Parameter.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

enum ParamType {
	
	case boolean
	case integer
	case double
	case string
	case array
	case table
}

struct Param {
	
	let rawValue: Any
	let type: ParamType
	
	var booleanValue: Bool? {
		get {
			if let flag = rawValue as? Bool {
				return flag
			}
			if let n = integerValue {
				return n != 0
			}
			return nil
		}
	}
	
	var integerValue: Int? {
		get {
			if let n = rawValue as? Int {
				return n
			}
			return nil
		}
	}
	
	var doubleValue: Double? {
		get {
			if let d = rawValue as? Double {
				return d
			}
			return nil
		}
	}
	
	var stringValue: String? {
		get {
			if let s = rawValue as? String {
				return s
			}
			return nil
		}
	}
	
	var arrayValue: [Any]? {
		get {
			if let a = rawValue as? [Any] {
				return a
			}
			return nil
		}
	}
	
	var tableValue: [String: Any]? {
		get {
			if let t = rawValue as? [String: Any] {
				return t
			}
			return nil
		}
	}
	
	init(rawValue: Any, type: ParamType) {
		
		self.rawValue = rawValue
		self.type = type
	}
}
