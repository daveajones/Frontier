//
//  TreeType.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public typealias OperationParamInfo = (Bool, Bool) //evalParam1, evalParam2

public enum CodeTreeType: Int {
	
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
	case dotOp
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
	case forInLoop
	case global
	case osaScript
	case addValue
	case subtractValue
	case multiplyValue
	case divideValue
	
	static let evaluateNone: OperationParamInfo = (false, false)
	static let evaluateBoth: OperationParamInfo = (true, true)
	static let evaluateFirst: OperationParamInfo = (true, false)
	static let evaluateSecond: OperationParamInfo = (false, true)
	
	static let paramInfo: [CodeTreeType: OperationParamInfo] = [
		.noop: evaluateNone,
		.add: evaluateBoth,
		.subtract: evaluateBoth,
		.multiply: evaluateBoth,
		.divide: evaluateBoth,
		.mod: evaluateBoth,
		.identifier: evaluateNone,
		.const: evaluateNone,
		.unary: evaluateFirst,
		.not: evaluateFirst,
		.assign: evaluateSecond,
		.function: evaluateNone,
		.equals: evaluateBoth,
		.notEquals: evaluateBoth,
		.greaterThan: evaluateBoth,
		.lessThan: evaluateBoth,
		.greaterThanEquals: evaluateBoth,
		.lessThanEquals: evaluateBoth,
		.or: evaluateFirst,
		.and: evaluateFirst,
		.incrementPre: evaluateNone,
		.incrementPost: evaluateNone,
		.decrementPre: evaluateNone,
		.decrementPost: evaluateNone,
		.loop: evaluateFirst,
		.fileLoop: evaluateNone,
		.forLoop: evaluateBoth,
		.breakOp: evaluateNone,
		.returnOp: evaluateFirst,
		.bundle: evaluateNone,
		.ifOp: evaluateFirst,
		.proc: evaluateNone,
		.local: evaluateNone,
		.module: evaluateNone,
		.dotOp: evaluateNone,
		.array: evaluateNone,
		.addressOf: evaluateNone,
		.dereference: evaluateNone,
		.assignLocal: evaluateBoth,
		.bracket: evaluateNone,
		.caseOp: evaluateNone,
		.caseItem: evaluateNone,
		.caseBody: evaluateNone,
		.kernel: evaluateNone,
		.continueOp: evaluateNone,
		.with: evaluateNone,
		.forDownLoop: evaluateBoth,
		.tryOp: evaluateNone,
		.beginsWith: evaluateBoth,
		.endsWith: evaluateBoth,
		.contains: evaluateBoth,
		.range: evaluateBoth,
		.list: evaluateNone,
		.field: evaluateNone,
		.record: evaluateNone,
		.forInLoop: evaluateFirst,
		.global: evaluateNone,
		.osaScript: evaluateFirst,
		.addValue: evaluateSecond,
		.subtractValue: evaluateSecond,
		.multiplyValue: evaluateSecond,
		.divideValue: evaluateSecond,
	]
}
