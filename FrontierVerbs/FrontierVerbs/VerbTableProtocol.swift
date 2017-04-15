//
//  VerbTableProtocol.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

@objc protocol VerbTable {
	
	static var tableName: String {get}
	static var supportedVerbs: [String] {get}
	
}
