//
//  VerbSpecifier.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa

final class VerbSpecifier: NSObject {

	let tableName: String
	let verbName: String
	
	init(rawVerbName: String) {
		
		if rawVerbName.contains(".") {
			let components = rawVerbName.components(separatedBy: ".")
			tableName = components[0]
			verbName = components[1]
		}
		else {
			tableName = ""
			verbName = rawVerbName
		}
	}
	
	func canonicalName(verbTable: VerbTable) -> String? {
		
		let supportedVerbs = type(of: verbTable).supportedVerbs
		if supportedVerbs.contains(verbName) {
			return verbName
		}
		
		let lowerVerbName = verbName.lowercased()
		for oneVerbName in supportedVerbs {
			if lowerVerbName == oneVerbName.lowercased() {
				return oneVerbName
			}
		}
		
		return nil
	}
}
