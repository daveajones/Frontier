//
//  Math.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/23/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import XCTest
@testable import FrontierVerbs
import FrontierData

class Math: XCTestCase, VerbAppDelegate {
	
	func testMin() {
		
		var params = VerbParams([true, false])
		var result = try! MathVerbs.evaluate("min", params, self)
		if let oneResult = result as? Bool {
			XCTAssertTrue(oneResult == false)
		}
		else {
			XCTAssert(false, "Result must be a Bool")
		}
		
		params = VerbParams([5, true])
		result = try! MathVerbs.evaluate("min", params, self)
		if let oneResult = result as? Bool {
			XCTAssertTrue(oneResult == true)
		}
		else {
			XCTAssert(false, "Result must be a Bool")
		}
		
		params = VerbParams([5, 1000.384])
		result = try! MathVerbs.evaluate("min", params, self)
		if let oneResult = result as? Int {
			XCTAssertTrue(oneResult == 5)
		}
		else {
			XCTAssert(false, "Result must be an Int")
		}

		params = VerbParams(["foo", "apples"])
		result = try! MathVerbs.evaluate("min", params, self)
		if let oneResult = result as? String {
			XCTAssertTrue(oneResult == "apples")
		}
		else {
			XCTAssert(false, "Result must be a String")
		}
		
		let d1 = Date(timeIntervalSince1970: 5000.5)
		let d2 = Date(timeIntervalSince1904: 5000.5)
		params = VerbParams([d1, d2])
		result = try! MathVerbs.evaluate("min", params, self)
		if let oneResult = result as? Date {
			XCTAssertTrue(oneResult == d2)
		}
		else {
			XCTAssert(false, "Result must be a Date")
		}
	}
	
	func testMax() {
		
		var params = VerbParams([true, false])
		var result = try! MathVerbs.evaluate("max", params, self)
		if let oneResult = result as? Bool {
			XCTAssertTrue(oneResult == true)
		}
		else {
			XCTAssert(false, "Result must be a Bool")
		}
		
		params = VerbParams([5, true])
		result = try! MathVerbs.evaluate("max", params, self)
		if let oneResult = result as? Int {
			XCTAssertTrue(oneResult == 5)
		}
		else {
			XCTAssert(false, "Result must be an Int")
		}
		
		params = VerbParams([5, 1000.384])
		result = try! MathVerbs.evaluate("max", params, self)
		if let oneResult = result as? Double {
			XCTAssertTrue(oneResult == 1000.384)
		}
		else {
			XCTAssert(false, "Result must be a Double")
		}
		
		params = VerbParams(["foo", "apples"])
		result = try! MathVerbs.evaluate("max", params, self)
		if let oneResult = result as? String {
			XCTAssertTrue(oneResult == "foo")
		}
		else {
			XCTAssert(false, "Result must be a String")
		}
		
		let d1 = Date(timeIntervalSince1970: 5000.5)
		let d2 = Date(timeIntervalSince1904: 5000.5)
		params = VerbParams([d1, d2])
		result = try! MathVerbs.evaluate("max", params, self)
		if let oneResult = result as? Date {
			XCTAssertTrue(oneResult == d1)
		}
		else {
			XCTAssert(false, "Result must be a Date")
		}
	}

	func testSqrt() {
		
		var params = VerbParams([4])
		var result = try! MathVerbs.evaluate("sqrt", params, self)
		if let oneResult = result as? Double {
			XCTAssertTrue(oneResult == 2.0)
		}
		else {
			XCTAssert(false, "Result must be a Double")
		}

		let largeishNumber = 239845874
		params = VerbParams([largeishNumber * largeishNumber])
		result = try! MathVerbs.evaluate("sqrt", params, self)
		if let oneResult = result as? Double {
			XCTAssertTrue(oneResult == Double(largeishNumber))
		}
		else {
			XCTAssert(false, "Result must be a Double")
		}

		let largeishDouble = 239845.874
		params = VerbParams([largeishDouble * largeishDouble])
		result = try! MathVerbs.evaluate("sqrt", params, self)
		if let oneResult = result as? Double {
			XCTAssertTrue(oneResult == largeishDouble)
		}
		else {
			XCTAssert(false, "Result must be a Double")
		}
	
	}
}
