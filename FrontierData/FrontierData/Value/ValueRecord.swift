//
//  ValueRecord.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Record: Value {
	
	public var valueType: ValueType {
		get {
			return .record
		}
	}
	
	
	public var asBool: Bool? {
		get {
			//			return (coercelistvalue (v, booleanvaluetype));
			return true
		}
	}
	
	public var asInt: Int? {
		get {
			return 0 // TODO
		}
	}
	
	var asRecord: Record? {
		get {
			return self
		}
	}
}

