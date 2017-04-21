//
//  Address.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public struct Address {
	
	let hashTable: HashTable
	let name: String
	
	init(hashTable: HashTable, name: String) {
		
		self.hashTable = hashTable
		self.name = name
	}
}
