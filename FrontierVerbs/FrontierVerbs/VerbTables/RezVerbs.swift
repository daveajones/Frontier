//
//  RezVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

// No longer implemented.
// These verbs operated on resource fork items, which isn’t really a thing on OS X.

struct RezVerbs: VerbTable {
	
	private enum Verb: String {
		case getResource = "getresource"
		case putResource = "putresource"
		case getNamedResource = "getnamedresource"
		case putNamedResource = "putnamedresource"
		case countResTypes = "countrestypes"
		case getNthResType = "getnthrestype"
		case countResources = "countresources"
		case getNthResource = "getnthresource"
		case getNthResInfo = "getnthresinfo"
		case resourceExists = "resourceexists"
		case namedResourceExists = "namedresourceexists"
		case deleteResource = "deleteResource"
		case deleteNamedResource = "deleteNamedResource"
		case getResourceAttributes = "getresourceattributes"
		case setResourceAttributes = "setresourceattributes"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let _ = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		return false
	}
}
