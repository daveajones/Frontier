//
//  HashTable.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

// See tyhashtable in lang.h in FrontierOrigFork.

public final class HashTable {
	
	var dictionary = [String: Any]()
	var parentHashTable: HashTable?
	var dirty = false
	var locked = false
	var isLocalTable = false
	var representedObject: Any?
	var dateCreated: Date?
}

