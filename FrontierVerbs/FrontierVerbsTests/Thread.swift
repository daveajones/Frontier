//
//  Thread.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/23/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import XCTest
@testable import FrontierVerbs
import FrontierData
import FrontierCore

class Thread: XCTestCase, VerbAppDelegate {

	func testGetCurrentID() {

		// Tests run on the main thread.
		let result = try! ThreadVerbs.evaluate("getcurrentid", VerbParams.empty, self)
		if let oneResult = result as? Int {
			XCTAssertTrue(oneResult == ThreadSupervisor.mainThreadID)
		}
		else {
			XCTAssert(false, "Result must be an Int")
		}
	}
	
	func testGetCount() {
		
		// Should not be any ManagedThreads, so count should be one for the main thread.
		let result = try! ThreadVerbs.evaluate("getcount", VerbParams.empty, self)
		if let oneResult = result as? Int {
			XCTAssertTrue(oneResult == 1)
		}
		else {
			XCTAssert(false, "Result must be an Int")
		}
	}

}
