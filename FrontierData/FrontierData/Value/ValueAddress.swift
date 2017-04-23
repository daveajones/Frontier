//
//  ValueAddress.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Address: Value {
	
	public var valueType: ValueType {
		get {
			return .address
		}
	}
		
	public var asBool: Bool? {
		get {
			return false
			//return asString?.asBool ?? false
		}
	}
	
	public var asInt: Int? {
		get {
			return 0 //TODO
		}
	}
}
