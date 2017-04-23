//
//  ValueEnum.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Enum: Value {
	
	public var valueType: ValueType {
		get {
			return .enumType
		}
	}
	
	public var asBool: Bool? {
		get {
			return false // TODO
			//return asInt! != 0 && asOSType != OSType("fals")
		}
	}
	
	public var asInt: Int? {
		get {
			return 0 // TODO
//			return Int(enumValue)
		}
	}
	
	var asEnum: Enum? {
		get {
			return self
		}
	}
}
