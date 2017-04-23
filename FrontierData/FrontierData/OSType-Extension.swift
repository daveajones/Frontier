//
//  OSType-Extension.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public extension OSType {
	
	init(_ string: String) {
		
		let utf16Characters = string.utf16
		assert(utf16Characters.count == 4, "An OSType takes exactly four characters.")
	
		var osType: OSType = 0
		for oneCharacter in utf16Characters {
			assert(oneCharacter < 256, "An OSType requires ASCII characters.")
			osType = (osType << 8) + OSType(oneCharacter)
		}
		self = osType
	}
}
