//
//  VerbRunner.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

final class VerbRunner: NSObject {
	
	let verbTables = [FileVerbs.tableName: FileVerbs()]
	let langVerbTable = LangVerbs()
	
	func run(verbName: String, parameters: VerbParameters) -> VerbResult {
		
		// TODO: VerbResult verb-not-found error
		
		let verbSpecifier = VerbSpecifier(rawVerbName: verbName)
		guard let verbTable = findVerbTable(for: verbSpecifier.tableName) else { return VerbResult.empty }
		guard let canonicalVerbName = verbSpecifier.canonicalName(verbTable: verbTable) else { return VerbResult.empty }
		
		if let objcVerbTable = verbTable as? NSObject {
			let selector = NSSelectorFromString(canonicalVerbName + ":")
			if let unmanagedResult = objcVerbTable.perform(selector, with: parameters) {
				if let result = unmanagedResult.takeUnretainedValue() as? VerbResult {
					return result
				}
			}
		}
		return VerbResult.empty
	}
}

private extension VerbRunner {
	
	func findVerbTable(for tableName: String) -> VerbTable? {
		
		if tableName.isEmpty {
			return langVerbTable
		}
		
		if let table = verbTables[tableName] {
			return table
		}
		
		let lowercaseTableName: String = tableName.lowercased()
		for (oneTableName, oneVerbTable) in verbTables {
			if lowercaseTableName == oneTableName.lowercased() {
				return oneVerbTable
			}
		}
		
		return nil
	}
}
