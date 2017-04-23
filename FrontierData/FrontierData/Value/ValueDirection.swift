//
//  ValueDirection.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Direction: Value {
	
	public var valueType: ValueType {
		get {
			return .direction
		}
	}
	
	
	public var asBool: Bool? {
		get {
			return self != .noDirection
		}
	}
	
	public var asInt: Int? {
		get {
			return self.rawValue
		}
	}
	
	public var asDate: Date? {
		get {
			return nil // TODO
		}
	}
	
	public var asDirection: Direction? {
		get {
			return self
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
			return nil //TODO
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
			return nil //TODO
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
}
