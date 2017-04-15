//
//  FileVerbs.swift
//  FrontierVerbs
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Cocoa

final class FileVerbs: NSObject, VerbTable {

	static let tableName = "file"
	static let supportedVerbs = ["getPathChar", "readWholeFile"]
	
	dynamic func readWholeFile(_ params: VerbParameters) -> VerbResult {
		
		return VerbResult.empty
	}
	
	dynamic func getPathChar(_ params: VerbParameters) -> VerbResult {
		
		return VerbResult.empty
	}
}
