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
	
	func isEqualTo(_ otherValue: Value) -> Bool
}

public extension Value {
	
	func commonCoercionType(with otherValue: Value) -> ValueType? {
		
		return valueType.commonCoercionType(otherValueType: otherValue.valueType)
	}
	
//	func valuesCoercedToCommonType(with otherValue: Value) -> (Value, Value)? {
//		
//		// TODO: throw error instead of return optional.
//		
//		if let commonType = commonCoercionType(with: otherValue) {
//			if let v1 = self.asType(commonType), let v2 = otherValue.asType(commonType) {
//				return (v1, v2)
//			}
//		}
//		return nil
//	}
	
	func asType(_ valueType: ValueType) -> Value? {
		
		switch valueType {
			
		case .none:
			return NSNull()
		case .bool:
			return asBool
		case .int:
			return asInt
		case .date:
			return asDate
		case .direction:
			return asDirection
		case .os:
			return asOSType
		case .enumType:
			return asEnum
		case .string:
			return asString
		case .address:
			return asAddress
		case .binary:
			return asBinary
		case .double:
			return asDouble
		case .list:
			return asList
			//		case .record:
		//			return asRecord
		default:
			return nil
		}
	}
	
	func isEqualTo(_ otherValue: Value) -> Bool {
		
		if valueType != otherValue.valueType {
			return false
		}
		switch valueType {
			
		case .none:
			return true
		case .bool:
			return asBool == otherValue.asBool
		case .int:
			return asInt == otherValue.asInt
		case .date:
			return asDate == otherValue.asDate
		case .direction:
			return asDirection == otherValue.asDirection
		case .os:
			return asInt == otherValue.asInt
		case .enumType:
			return asInt == otherValue.asInt
		case .string:
			return asString == otherValue.asString
		case .address:
			return asAddress == otherValue.asAddress
		case .binary:
			return asBinary == otherValue.asBinary
		case .double:
			return asDouble == otherValue.asDouble
		case .list:
			return asList!.isEqualTo(otherList: otherValue.asList!)
//		case .record:
//			return asRecord == otherValue.asRecord
		default:
			return false
		}
	}
}
