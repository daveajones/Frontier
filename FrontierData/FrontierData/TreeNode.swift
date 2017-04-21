//
//  TreeNode.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public struct TreeNode {
	
	let nodeType: TreeType
	let value: Value?
	let lineNumber: Int?
	let characterIndex: Int?
	let params: [TreeNode]?
}
