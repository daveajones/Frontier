//
//  ValueInt.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Int: Value {
	
	public var valueType: ValueType {
		get {
			return .int
		}
	}
	
	public var asBool: Bool? {
		get {
			return self != 0
		}
	}
	
	public var asInt: Int? {
		get {
			return self
		}
	}

	public var asDate: Date? {
		get {
			return Date(timeIntervalSince1904: asDouble!)
		}
	}
	
	public var asDirection: Direction? {
		get {
			return Direction(rawValue: self)
		}
	}
	
	public var asOSType: OSType? {
		get {
			return nil //TODO
		}
	}
	
	public var asEnum: Enum? {
		get {
			return nil //TODO
		}
	}
	
	public var asString: String? {
		get {
			return "\(self)"
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
			return Double(self)
		}
	}
	
	public var asList: List? {
		get {
			return nil //TODO
		}
	}
	
	public var asRecord: Record? {
		get {
			return nil //TODO
		}
	}
	
	public func unaryMinusValue() throws -> Value {
		
		return 0 - self
	}
}
