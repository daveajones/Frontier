//
//  Address.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public struct Address: Equatable {

	let hashTable: HashTable
	let name: String
	
	init(hashTable: HashTable, name: String) {
		
		self.hashTable = hashTable
		self.name = name
	}
	
	// MARK: Equatable
	
	public static func ==(lhs: Address, rhs: Address) -> Bool {
		
		return lhs.hashTable === rhs.hashTable && lhs.name == rhs.name
	}

}
