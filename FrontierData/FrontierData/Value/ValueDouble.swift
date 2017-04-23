//
//  ValueDouble.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Double: Value {
	
	public var valueType: ValueType {
		get {
			return .double
		}
	}
	
	
	public var asBool: Bool? {
		get {
			return self != 0.0
		}
	}
	
	public var asInt: Int? {
		get {
			return Int(self)
		}
	}
	
	var asDouble: Double? {
		get {
			return self
		}
	}
}
