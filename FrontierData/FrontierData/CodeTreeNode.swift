//
//  CodeTreeNode.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public struct CodeTreeNode {
	
	let nodeType: CodeTreeType
	let value: Value?
	let lineNumber: Int?
	let characterIndex: Int?
	let params: [CodeTreeNode]?
}
