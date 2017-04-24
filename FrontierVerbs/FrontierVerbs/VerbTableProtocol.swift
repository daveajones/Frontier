//
//  VerbTableProtocol.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

public protocol VerbTable {
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value
}
