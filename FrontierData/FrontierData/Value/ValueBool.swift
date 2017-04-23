//
//  ValueBool.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Bool: Value {
	
	public var valueType: ValueType {
		get {
			return .bool
		}
	}
	
	
	public var asBool: Bool? {
		get {
			return self
		}
	}
	
	public var asInt: Int? {
		get {
			return self ? 1 : 0
		}
	}
}
