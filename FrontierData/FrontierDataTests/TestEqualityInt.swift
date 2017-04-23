//
//  TestEqualityInt.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import XCTest
import FrontierData

class TestEqualityInt: XCTestCase {

	func testIntDoubleEquality() {
		
		XCTAssertTrue(0.asDouble!.isEqualTo(Double(0.0)))
		XCTAssertTrue(1.asDouble!.isEqualTo(Double(1.0)))
		XCTAssertTrue(1_000_000.asDouble!.isEqualTo(Double(1_000_000.0)))
		XCTAssertTrue(938_843.asDouble!.isEqualTo(Double(938_843.0)))
	}

	func testIntDateEquality() {
		
		let ints: [Int] = [0, 1, 3948, 3458997234789, 25807435, 23958, -239, -239823483337]
		for oneInt in ints {
			let oneDate = Date(timeIntervalSince1904: TimeInterval(oneInt))
			XCTAssertTrue(oneInt.asDate!.isEqualTo(oneDate))
		}
	}
	
	func testIntDirectionEquality() {
		
		XCTAssertTrue(0.asDirection!.isEqualTo(Direction.noDirection))
		XCTAssertTrue(1.asDirection!.isEqualTo(Direction.up))
		XCTAssertTrue(2.asDirection!.isEqualTo(Direction.down))
		XCTAssertTrue(3.asDirection!.isEqualTo(Direction.left))
		XCTAssertTrue(4.asDirection!.isEqualTo(Direction.right))
		XCTAssertTrue(5.asDirection!.isEqualTo(Direction.flatUp))
		XCTAssertTrue(6.asDirection!.isEqualTo(Direction.flatDown))
		XCTAssertTrue(8.asDirection!.isEqualTo(Direction.sorted))
		XCTAssertTrue(9.asDirection!.isEqualTo(Direction.pageUp))
		XCTAssertTrue(10.asDirection!.isEqualTo(Direction.pageDown))
		XCTAssertTrue(11.asDirection!.isEqualTo(Direction.pageLeft))
		XCTAssertTrue(12.asDirection!.isEqualTo(Direction.pageRight))
	}
	
	func testIntStringEquality() {
		
		let ints: [Int] = [0, 1, 3948, 3458997234789, 25807435, 23958, -239, -239823483337]
		for oneInt in ints {
			let oneString = "\(oneInt)"
			XCTAssertTrue(oneInt.asString!.isEqualTo(oneString))
		}
	}
}
