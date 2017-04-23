//
//  List.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// This is an immutable struct for now, and I hope it can stay that way, but we’ll see.
// For example: you can build up a ListArray and then create a List struct when completed.

public typealias ListArray = [Value]

public struct List {

	let listArray: ListArray
	let count: Int
	
	subscript(n: Int) -> Value {
		get {
			return listArray[n]
		}
	}
	
	public init(_ listArray: ListArray) {
		
		self.listArray = listArray
		self.count = listArray.count
	}
	
	public init(value: Value) {
		var tempArray = ListArray()
		tempArray.append(value)
		self.init(tempArray)
	}
	
	func listByAdding(value: Value) -> List {
		
		var tempArray = listArray
		tempArray.append(value)
		return List(tempArray)
	}
	
	func listByRemovingValue(at ix: Int) -> List {
		
		assert(ix < count, "Can’t remove list value \(ix) when count is \(count)")
		if ix < count {
			return self
		}
		
		var tempArray = listArray
		tempArray.remove(at: ix)
		return List(tempArray)
	}
	
	func listByInserting(value: Value, at ix: Int) -> List {
		
		assert(ix <= count, "Can’t add list value at \(ix) when count is \(count)")
		if ix <= count {
			return self
		}

		if ix == count {
			return listByAdding(value: value)
		}
		
		var tempArray = listArray
		tempArray.insert(value, at: ix)
		return List(tempArray)
	}
	
	func isEqualTo(otherList: List) -> Bool {
		
		// Arrays aren’t Equatable, but we might need this.
		
		if count != otherList.count {
			return false
		}
		
		var ix = 0
		for oneValue in listArray {
			if !oneValue.isEqualTo(otherList[ix]) {
				return false
			}
			ix = ix + 1
		}
		
		return true
	}
}
