//
//  ValueDate.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/21/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// Mac dates, before OS X, started January 1, 1904.
// This is the number of seconds between old Mac dates and Unix dates.
private let unixEpochMinusOldMacEpoch = 2082844800.0

extension Date: Value {
	
	public var valueType: ValueType {
		get {
			return .date
		}
	}
	
	public var asBool: Bool? {
		get {
			return asInt! != 0
		}
	}
	
	public var asInt: Int? {
		get {
			return Int(timeIntervalSince1904)
		}
	}
	
	public var asDate: Date? {
		get {
			return self
		}
	}
	
	public var asDirection: Direction? {
		get {
			return nil //TODO
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
			return self.timeIntervalSince1904
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

	public init(timeIntervalSince1904: TimeInterval) {
		
		self.init(timeIntervalSince1970: timeIntervalSince1904 - unixEpochMinusOldMacEpoch)
	}
}

private extension Date {
	
	var timeIntervalSince1904: TimeInterval {
		
		return timeIntervalSince1970 + unixEpochMinusOldMacEpoch
	}
}
