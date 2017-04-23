//
//  ValueNone.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension NSNull: Value {
	
	public var valueType: ValueType {
		get {
			return .none
		}
	}
	
	public var asBool: Bool? {
		get {
			return false
		}
	}
	
	public var asInt: Int? {
		get {
			return 0
		}
	}
	
	var asDate: Date {
		
		return Date(timeIntervalSince1904: 0.0)
	}
}
