//
//  ValueList.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension List: Value {
	
	public var valueType: ValueType {
		get {
			return .list
		}
	}
	
	public var asBool: Bool? {
		get {
			// 			return (coercelistvalue (v, booleanvaluetype));

			return true
		}
	}
	
	public var asInt: Int? {
		get {
			return 0 //TODO
		}
	}
}
