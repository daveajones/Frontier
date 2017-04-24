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
	
	public func runCode(codeTreeNode: CodeTreeNode, context: HashTable?) throws -> Value {
		
		guard let firstNode = codeTreeNode.params?[0] else {
			return false //TODO: empty script error, perhaps
		}
		
		do {
			return try evaluateList(firstNode)
		}
		catch { throw error }
	}
	
	public func evaluateList(_ codeTreeNode: CodeTreeNode) throws -> Value {
		
		var programCounter: CodeTreeNode? = codeTreeNode
		var val: Value?
		
		do {
			while true {
				
				if programCounter == nil {
					break
				}
				
				setErrorLine(programCounter!)
				
				// TODO: check if user killed script
				// TODO: check if debugger killed script
				
				val = try evaluateTree(programCounter!)
				
				if let next = programCounter!.link {
					programCounter = next
				}
			}
		}
		catch { throw error }
		
		return val ?? false
	}
	
	public func evaluateTree(_ node: CodeTreeNode) throws -> Value {
		
		let _ = node.nodeType
		let ctParams = node.params?.count ?? 0
		
		if ctParams > 0 {
			
			
		}
		
		return true //TODO: return real value
	}
}

private extension LangEvaluator {
	
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
