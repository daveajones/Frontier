//
//  TestEqualityBool.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import XCTest
import FrontierData

class TestEqualityBool: XCTestCase {

    func testBoolEquality() {
 
		XCTAssertTrue(true.isEqualTo(true))
		XCTAssertTrue(false.isEqualTo(false))
	}
	
	func testBoolInequality() {
		
		XCTAssertFalse(true.isEqualTo(false))
		XCTAssertFalse(false.isEqualTo(true))
	}
	
	func testBoolIntEquality() {
		
		XCTAssertTrue(true.asInt!.isEqualTo(1))
		XCTAssertTrue(false.asInt!.isEqualTo(0))
	}
	
	func testBoolIntInequality() {
		
		XCTAssertFalse(false.asInt!.isEqualTo(1))
		XCTAssertFalse(true.asInt!.isEqualTo(0))
	}
	
	func testBoolDoubleEquality() {
		
		XCTAssertTrue(true.asDouble!.isEqualTo(1.0))
		XCTAssertTrue(false.asDouble!.isEqualTo(0.0))
	}
	
	func testBoolDateEquality() {
		
		XCTAssertTrue(true.asDate!.isEqualTo(Date(timeIntervalSince1904: 1.0)))
		XCTAssertTrue(false.asDate!.isEqualTo(Date(timeIntervalSince1904: 0.0)))
	}
	
	func testBoolDirectionEquality() {
		
		XCTAssertTrue(true.asDirection!.isEqualTo(Direction.up))
		XCTAssertTrue(false.asDirection!.isEqualTo(Direction.noDirection))
	}
	
	func testBoolStringEquality() {
		
		XCTAssertTrue(true.asString!.isEqualTo("true"))
		XCTAssertTrue(false.asString!.isEqualTo("false"))
	}
	
	func testBoolListEquality() {
		
		let listFalse = List(value: false)
		let listTrue = List(value: true)
		XCTAssertTrue(true.asList!.isEqualTo(listTrue))
		XCTAssertTrue(false.asList!.isEqualTo(listFalse))
	}
}

