//
//  Lang.swift
//  UserTalk
//
//  Created by Brent Simmons on 4/23/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

public class LangEvaluator {
	
	fileprivate var lineNumber = 0
	fileprivate var characterIndex = 0
	fileprivate var errorNode: CodeTreeNode?
	fileprivate var flreturn = false
	fileprivate var flbreak = false
	fileprivate var flcontinue = false
	
	public func runCode(codeTreeNode: CodeTreeNode, context: HashTable?) throws -> Value {
		
		guard let firstNode = codeTreeNode.param1? else {
			return false //TODO: empty script error, perhaps
		}
		
		do {
			return try evaluateList(firstNode)
		}
		catch { throw error }
	}
	
	public func evaluateList(_ codeTreeNode: CodeTreeNode) throws -> Value {
		
		var programCounter: CodeTreeNode? = codeTreeNode
		var val = emptyValue
		
		do {
			while true {
				
				if programCounter == nil {
					break
				}
				
				setErrorLine(programCounter!)
				
				// TODO: check if user killed script
				// TODO: check if debugger killed script
				
				val = try evaluateTree(programCounter!)
				
				if flbreak || flreturn || flcontinue {
					break
				}
				
				if let next = programCounter!.link {
					programCounter = next
				}
			}
		}
		catch let e = LangError {
			if let _ = e.lineNumber {
				throw e
			}
			else {
				throw langError(e.errorType)
			}
		}
		catch { throw error }
		
		return val
	}
	
	public func evaluateTree(_ node: CodeTreeNode) throws -> Value {
		
		let op = node.nodeType
		let ctParams = node.ctParams
		var val1 = emptyValue
		var val2 = emptyValue
		
		do {
			if ctParams > 0 && op.shouldEvaluateParam1 {
				
				val1 = try evaluateTree(node.param1!)
				if flreturn {
					return true
				}
			}
			
			if ctParams > 1 && op.shouldEvaluateParam2 {
				
				let result = try evaluateTree(node.param2!)
				if flreturn {
					return true
				}
			}
			
			setErrorLine(node)
			
			switch op {
				
			case .noop:
				return true
				
			case local:
				return addLocals(node)
				
			case .module:
				return addHandler(node)
				
			case .identifier, .bracket:
				return idvalue(node)
				
			case .dot:
				return dotValue(node)
				
			case .addressOf:
				return addressOfValue(node.param1)
				
			case .dereference:
				return dereferenceValue(node.param1)
				
			case .array:
				return arrayValue(node)
				
			case .const:
				return copyValue(node)
			
			case .assign:
				if !assignValue(node.param1, val2) {
					return false
				}
				if val2.valueType == .external || !needAssignmentResult(node) {
					return true
				}
				return copyValue(val2)
				
			case .function:
				return functionValue(node.param1, node.param2)
				
			case .add:
				return val1.add(val2)
				
			case .subtract:
				return val1.subtract(val2)
				
			case unary:
				return val1.unaryMinusValue()
				
			case .multiply:
				return val1.multiply(val2)
				
			case .divide:
				return val1.divide(val2)
				
			case .addValue:
				return modifyAssignValue(node.param1, val2, .add, needAssignmentResult(node))
				
			case .subtractValue:
				return modifyAssignValue(node.param1, val2, .subtract, needAssignmentResult(node))
				
			case .multiplyValue:
				return modifyAssignValue(node.param1, val2, .multiply, needAssignmentResult(node))
				
			case .divideValue:
				return modifyAssignValue(node.param1, val2, .divide, needAssignmentResult(node))
				
			case .mod:
				return val1.mod(val2)
				
			case .not:
				return val1.not()
				
			case .equals:
				return val1.isEqualTo(val2)
				
			case .notEquals:
				return !(val1.isEqualTo(val2))
				
			case .greaterThan:
				return val1.greaterThan(val2)
				
			case .lessThan:
				return val1.lessThan(val2)
				
			case .greaterThanEquals:
				return val1.greaterThanEqual(val2)
				
			case .lessThanEquals:
				return val1.lessThanEqual(val2)
				
			case .beginsWith:
				return val1.beginsWith(val2)
				
			case .contains:
				return val1.contains(val2)
				
			case .orOr:
				return orOrValue(val1, node.param2!)
				
			case .andAnd:
				return andAndValue(val1, node.param2!)
				
			case .breakOp:
				flbreak = true
				return true
				
			case .continueOp:
				flcontinue = true
				return true
				
			case .with:
				return evaluateWith(node)
				
			case .returnOp:
				flreturn = true
				if val1.valueType == .none {
					return true
				}
				return val1
				
			case .bundle:
				return evaluateList(h.param1)
				
			case .ifOp: {
				let fl = val1.asBool
				if let ifNode = fl ? node.param2 ? node.param3 {
					return evaluateList(ifNode)
				}
				else {
					return true
				}
				}
				
			case .caseOp:
				return evaluateCase(node)
				
			case .loop:
				return evaluateLoop(node)
				
			case .fileLoop:
				return evaluateFileLoop(node)
				
			case .forLoop:
				return evaluateForLoop(node, val1, val2, 1)
				
			case .forDownLoop:
				return evaluateForLoop(node, val1, val2, -1)
				
			case .incrPre:
				return incrementValue(true, true, node.param1)
				
			case .incrPost:
				return incrementValue(true, false, node.param1)
				
			case .decrPre:
				return incrementValue(false, true, node.param1)
				
			case .decrPost:
				return incrementValue(false, false, node.param1)
				
			case .tryOp:
				return evaluateTry(node)
				
			case .range:
				throw langError(.badRangeOperation)
				
			case .field:
				throw langError(.badFieldOperation)
				
			case .list:
				return makeListValue(node.param1)
				
			case .record:
				return makeRecordValue(node.param1, false)
				
			case .forInLoop:
				return evaluateForInLoop(node, val1)
				
			default:
				break
			}
			
			throw langError(.unexpectedOpCode)
		}
			
		catch let e = LangError {
			if let _ = e.lineNumber {
				throw e
			}
			else {
				throw langError(e.errorType)
			}
		}
		catch {
			throw error
		}
	}
}

private extension LangEvaluator {
	
	func langError(_ errorType: LangError.LangErrorType) -> LangError {
	
		return LangError(errorType, lineNumber: lineNumber, characterIndex: characterIndex)
	}
	
	func setErrorLine(_ node: CodeTreeNode) {
		
		if let lineNumber = node.lineNumber {
			self.lineNumber = lineNumber
		}
		if let characterIndex = node.characterIndex {
			self.characterIndex = characterIndex
		}
		errorNode = node
	}
}
