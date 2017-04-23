//
//  VerbParameters.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa
import FrontierData

struct VerbParams {

	let ordered: [Value]
	let named: [String: Value]
	let count: Int
	
	var binaryParams: (Value, Value)? {
		get {
			if count == 2 {
				return (ordered[0], ordered[1])
			}
			return nil
		}
	}
	
	var singleParam: Value? {
		get {
			if count == 1 {
				return ordered[0]
			}
			return nil
		}
	}
	
	init(ordered: [Value], named: [String: Value]) {
		
		self.ordered = ordered
		self.named = named
		self.count = ordered.count
	}
}
