//
//  Value.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public struct Value {

	let type: ValueType
	
	let booleanValue: Bool?
	let integerValue: Int?
	let dateValue: Date?
	let directionValue: Direction?
	let osTypeValue: OSType?
	let stringValue: String?
	let addressValue: Address?
	let binaryValue: Data?
//	let codeValue: TreeNode?
//	let externalValue: ExternalValue?
	let pointValue: NSPoint?
	let doubleValue: Double?
	let listValue: [Value]?
	let recordValue: [OSType: Value]?
	
}
