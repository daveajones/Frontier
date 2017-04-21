//
//  ValueType.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public enum ValueType: Int {
	
	// These are stored on disk: they shouldn’t change. See lang.h.
	// These are not all still supported.
	
	case uninitialized = -1
	case none = 0
	case char = 1
	case int = 2
	case long = 3
	case oldString = 4
	case binary = 5
	case boolean = 6
	case token = 7
	case date = 8
	case address = 9
	case code = 10
	case double = 11
	case string = 12
	case external = 13
	case direction = 14
	case password = 15
	case os = 16
	case unused = 17
	case point = 18
	case qdRect = 19
	case qdPattern = 20
	case qdRGB = 21
	case fixed = 22
	case single = 23
	case oldDouble = 24
	case objSpec = 25
	case fileSpec = 26
	case alias = 27
	case enumType = 28
	case list = 29
	case record = 30
	case outline = 31
	case word = 32
	case head = 33
	case table = 34
	case script = 35
	case menu = 36
	case qdPict = 37
}
