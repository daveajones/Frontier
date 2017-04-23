//
//  Value.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// Go with asBool etc. because boolValue and similar conflict with existing methods.

public protocol Value {
	
	var valueType: ValueType { get }

	var asBool: Bool? { get }
	var asInt: Int? { get }
	var asDate: Date? { get }
	var asDirection: Direction? { get }
	var asOSType: OSType? { get }
	var asEnum: Enum? { get }
	var asString: String? { get }
	var asAddress: Address? { get }
	var asBinary: Data? { get }
	var asDouble: Double? { get }
	var asList: List? { get }
	var asRecord: Record? { get }
}

