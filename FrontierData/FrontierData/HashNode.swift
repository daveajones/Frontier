//
//  HashNode.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public final class HashNode {
	
	var value: Any?
	var dontSave = false //May not get packed
	var locked = false
	var containsUnresolvedAddress = false
	var name: String?
	
}
