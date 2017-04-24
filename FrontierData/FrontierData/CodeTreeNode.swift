//
//  CodeTreeNode.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public class CodeTreeNode {
	
	public let nodeType: CodeTreeType
	public let value: Value?
	public let lineNumber: Int?
	public let characterIndex: Int?
	public let link: CodeTreeNode?
	public let params: [CodeTreeNode]?
	
	public init(nodeType: CodeTreeType, value: Value?, lineNumber: Int?, characterIndex: Int?, link: CodeTreeNode?, params: [CodeTreeNode]?) {
		
		self.nodeType = nodeType
		self.value = value
		self.lineNumber = lineNumber
		self.characterIndex = characterIndex
		self.link = link
		self.params = params
	}
}
