//
//  Value.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// Go with asBool etc. because boolValue and similar conflict with existing methods.

public static var emptyValue: Value = NSNull()

public protocol Value {
	
	var valueType: ValueType { get }
	
	// TODO: make the as* properties functions that can throw.
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
	
	func isEqualTo(_ otherValue: Value) throws -> Bool
	
	func unaryMinusValue() throws -> Value
	func not() throws -> Bool
	func beginsWith(_ otherValue: Value) throws -> Bool
	func endsWith(_ otherValue: Value) throws -> Bool
	func contains(_ otherValue: Value) throws -> Bool
	func modValue(_ otherValue: Value) throws -> Value
	func add(_ otherValue: Value) throws -> Value
	func subtract(_ otherValue: Value) throws -> Value
	func divide(_ otherValue: Value) throws -> Value
	func multiply(_ otherValue: Value) throws -> Value

	func compareTo(_ otherValue: Value) throws -> ComparisonResult

	// If you implement compareTo, you can probably stick with the default version of these (see extension below).
	func lessThan(_ otherValue: Value) throws -> Bool
	func lessThanEqual(_ otherValue: Value) throws -> Bool
	func greaterThan(_ otherValue: Value) throws -> Bool
	func greaterThanEqual(_ otherValue: Value) throws -> Bool
}

public extension Value {
	
	func commonCoercionType(with otherValue: Value) -> ValueType {
		
		return valueType.commonCoercionType(otherValueType: otherValue.valueType)
	}
	
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
	
	func unaryMinusValue() throws -> Value {
		
		throw LangError(.unaryMinusNotPossible)
	}
	
	func not() throws -> Bool {
		
		throw LangError(.booleanCoerce)
	}
	
	func beginsWith(_ otherValue: Value) throws -> Bool {
		
		return false // TODO
	}
	
	func endsWith(_ otherValue: Value) throws -> Bool {
		
		return false // TODO
	}
	
	func contains(_ otherValue: Value) throws -> Bool {
		
		return false // TODO
	}
	
	func lessThan(_ otherValue: Value) throws -> Bool {
		
		do {
			let comparisonResult = try compareTo(otherValue)
			return comparisonResult == .orderedAscending
		}
		catch { throw error }
	}
	
	func lessThanEqual(_ otherValue: Value) throws -> Bool {
		
		do {
			let comparisonResult = compareTo(otherValue)
			return comparisonResult == .orderedAscending || comparisonResult == .orderedSame
		}
		catch { throw error }
	}
	
	func greaterThan(_ otherValue: Value) throws -> Bool {
		
		do {
			let comparisonResult = compareTo(otherValue)
			return comparisonResult == .orderedDescending
		}
		catch { throw error }
	}
	
	func greaterThanEqual(_ otherValue: Value) throws -> Bool {
		
		do {
			let comparisonResult = compareTo(otherValue)
			return comparisonResult == .orderedDescending || comparisonResult == .orderedSame
		}
		catch { throw error }
	}
	
	func modValue(_ otherValue: Value) throws -> Value {
		
		return 0 // TODO
	}
	
	func add(_ otherValue: Value) throws -> Value {
		
		return 0 // TODO
	}
	
	func subtract(_ otherValue: Value) throws -> Value {
		
		return 0 // TODO
	}
	
	func divide(_ otherValue: Value) throws -> Value {
		
		return 0 // TODO
	}
	
	func multiply(_ otherValue: Value) throws -> Value {
		
		return 0 // TODO
	}
}
