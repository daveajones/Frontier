//
//  ThreadSupervisorTests.swift
//  FrontierCore
//
//  Created by Brent Simmons on 4/23/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import XCTest
@testable import FrontierCore

class ThreadSupervisorTests: XCTestCase {

    func testExample() {
		
		// Tests run on the main thread.
		XCTAssertEqual(ThreadSupervisor.currentThreadID(), ThreadSupervisor.mainThreadID)
    }
}
