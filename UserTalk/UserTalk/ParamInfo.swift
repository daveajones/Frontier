//
//  ParamInfo.swift
//  UserTalk
//
//  Created by Brent Simmons on 4/24/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

private enum OperationParamInfo {
	
	case evaluateNone
	case evaluateBoth
	case evaluateFirst
	case evaluateSecond
	
	func evaluateParam1() -> Bool {
		return self == .evaluateBoth || self == .evaluateFirst
	}
	
	func evaluateParam2() -> Bool {
		return self == .evaluateBoth || self == .evaluateSecond
	}
}

extension CodeTreeType {
	
	private static let operationParamInfo: [CodeTreeType: OperationParamInfo] = [
		.noop: .evaluateNone,
		.add: .evaluateBoth,
		.subtract: .evaluateBoth,
		.multiply: .evaluateBoth,
		.divide: .evaluateBoth,
		.mod: .evaluateBoth,
		.identifier: .evaluateNone,
		.const: .evaluateNone,
		.unary: .evaluateFirst,
		.not: .evaluateFirst,
		.assign: .evaluateSecond,
		.function: .evaluateNone,
		.equals: .evaluateBoth,
		.notEquals: .evaluateBoth,
		.greaterThan: .evaluateBoth,
		.lessThan: .evaluateBoth,
		.greaterThanEquals: .evaluateBoth,
		.lessThanEquals: .evaluateBoth,
		.or: .evaluateFirst,
		.and: .evaluateFirst,
		.incrementPre: .evaluateNone,
		.incrementPost: .evaluateNone,
		.decrementPre: .evaluateNone,
		.decrementPost: .evaluateNone,
		.loop: .evaluateFirst,
		.fileLoop: .evaluateNone,
		.forLoop: .evaluateBoth,
		.breakOp: .evaluateNone,
		.returnOp: .evaluateFirst,
		.bundle: .evaluateNone,
		.ifOp: .evaluateFirst,
		.proc: .evaluateNone,
		.local: .evaluateNone,
		.module: .evaluateNone,
		.dotOp: .evaluateNone,
		.array: .evaluateNone,
		.addressOf: .evaluateNone,
		.dereference: .evaluateNone,
		.assignLocal: .evaluateBoth,
		.bracket: .evaluateNone,
		.caseOp: .evaluateNone,
		.caseItem: .evaluateNone,
		.caseBody: .evaluateNone,
		.kernel: .evaluateNone,
		.continueOp: .evaluateNone,
		.with: .evaluateNone,
		.forDownLoop: .evaluateBoth,
		.tryOp: .evaluateNone,
		.beginsWith: .evaluateBoth,
		.endsWith: .evaluateBoth,
		.contains: .evaluateBoth,
		.range: .evaluateBoth,
		.list: .evaluateNone,
		.field: .evaluateNone,
		.record: .evaluateNone,
		.forInLoop: .evaluateFirst,
		.global: .evaluateNone,
		.osaScript: .evaluateFirst,
		.addValue: .evaluateSecond,
		.subtractValue: .evaluateSecond,
		.multiplyValue: .evaluateSecond,
		.divideValue: .evaluateSecond
	]

	private var paramInfo: OperationParamInfo {
		get {
			return CodeTreeType.operationParamInfo[self]!
		}
	}
	
	var shouldEvaluateParam1: Bool {
		get {
			return paramInfo.evaluateParam1()
		}
	}
	
	var shouldEvaluateParam2: Bool {
		get {
			return paramInfo.evaluateParam2()
		}
	}
}
