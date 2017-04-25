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
	
	public var asDate: Date? {
		get {
			return Date(timeIntervalSince1904: asDouble!)
		}
	}
	
	public var asDirection: Direction? {
		get {
			return Direction(rawValue: asInt!)
		}
	}
	
	public var asOSType: OSType? {
		get {
			return asInt!.asOSType
		}
	}
	
	public var asEnum: Enum? {
		get {
			return asInt!.asEnum
		}
	}
	
	public var asString: String? {
		get {
			return self ? "true" : "false"
		}
	}
	
	public var asAddress: Address? {
		get {
			return nil //TODO
		}
	}
	
	public var asBinary: Data? {
		get {
			return nil //TODO
		}
	}
	
	public var asDouble: Double? {
		get {
			return Double(asInt!)
		}
	}
	
	public var asList: List? {
		get {
			return List(value: self)
		}
	}
	
	public var asRecord: Record? {
		get {
			return nil //TODO
		}
	}
	
	public func unaryMinusValue() throws -> Value {
		
		return self
	}

}
