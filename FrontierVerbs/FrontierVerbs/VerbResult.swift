//
//  VerbResult.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

final class VerbResult: NSObject {

	static let empty = VerbResult(error: nil)
	let error: Error?
	
	init(error: Error?) {
		
		self.error = error
	}
}
