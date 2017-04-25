//
//  CodeTreeNode.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// TODO: move this and CodeTreeType into UserTalk.framework, since that’s the only place they're used

public class CodeTreeNode {
	
	public let nodeType: CodeTreeType
	public let value: Value?
	public let lineNumber: Int?
	public let characterIndex: Int?
	public let link: CodeTreeNode?
	public let param1: CodeTreeNode?
	public let param2: CodeTreeNode?
	public let param3: CodeTreeNode?
	public let param4: CodeTreeNode?
	public let ctParams: Int

	public init(nodeType: CodeTreeType, value: Value?, lineNumber: Int?, characterIndex: Int?, link: CodeTreeNode?, param1: CodeTreeNode?, param2: CodeTreeNode?, param3: CodeTreeNode?, param4: CodeTreeNode?) {
		
		self.nodeType = nodeType
		self.value = value
		self.lineNumber = lineNumber
		self.characterIndex = characterIndex
		self.link = link
		
		self.param1 = param1
		self.param2 = param2
		self.param3 = param3
		self.param4 = param4
		
		let ct: Int
		if let _ = param4 {
			ct = 4
		}
		else if let _ = param3 {
			ct = 3
		}
		else if let _ = param2 {
			ct = 2
		}
		else if let _ = param1 {
			ct = 1
		}
		self.ctParams = ct
	}
}
