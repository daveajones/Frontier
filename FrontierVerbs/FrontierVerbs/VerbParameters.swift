//
//  VerbParameters.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa

final class VerbParameters: NSObject {

	let ordered: [Parameter]
	let named: [String: Parameter]
	
	init(ordered: [Parameter], named: [String: Parameter]) {
		
		self.ordered = ordered
		self.named = named
	}
}
