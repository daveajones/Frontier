//
//  ValueChar.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension CChar: Value {
	
	public var valueType: ValueType {
		get {
			return .char
		}
	}
	
	
	public var asBool: Bool? {
		get {
			return self != 0
		}
	}
	
	public var asInt: Int? {
		get {
			return Int(self)
		}
	}
}
