//
//  ValueOSType.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension OSType: Value {
	
	public var valueType: ValueType {
		get {
			return .os
		}
	}
	
	
	public var asBool: Bool? {
		get {
			return asInt!.asBool
		}
	}
	
	public var asInt: Int? {
		get {
			return Int(self)
		}
	}
	
	var asOSType: OSType? {
		get {
			return self
		}
	}
}

