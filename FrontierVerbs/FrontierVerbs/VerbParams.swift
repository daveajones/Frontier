//
//  VerbParameters.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa

struct VerbParams {

	let ordered: [Param]
	let named: [String: Param]
	let count: Int
	
	init(ordered: [Param], named: [String: Param]) {
		
		self.ordered = ordered
		self.named = named
		self.count = ordered.count
	}
}
