//
//  TreeType.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public enum TreeType: Int {
	
	// "Op" is added at the end of some names, so as not to conflict with Swift keywords.
	
	case noop
	case add
	case subtract
	case multiply
	case divide
	case mod
	case identifier
	case const
	case unary
	case not
	case assign
	case function
	case equals
	case notEquals
	case greaterThan
	case lessThan
	case greaterThanEquals
	case lessThanEquals
	case or
	case and
	case incrementPre
	case incrementPost
	case decrementPre
	case decrementPost
	case loop
	case fileLoop
	case forLoop
	case breakOp
	case returnOp
	case bundle
	case ifOp
	case proc
	case local
	case module
	case doOp
	case array
	case addressOf
	case dereference
	case assignLocal
	case bracket
	case caseOp
	case caseItem
	case caseBody
	case kernel
	case continueOp
	case with
	case forDownLoop
	case tryOp
	case beginsWith
	case endsWith
	case contains
	case range
	case list
	case field
	case record
	case forIn
	case global
	case osaScript
	case addValue
	case subtractValue
	case multiplyValue
	case divideValue
}
