//
//  ValueBinary.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension Data: Value {
	
	public var valueType: ValueType {
		get {
			return .binary
		}
	}
	
	public var asBool: Bool? {
		get {
//			long n;
//			register Handle x = (*v).data.binaryvalue;
//			
//			if (getbinarynumber (x, &n))
//			fl = n != 0;
//			else
//			fl = gethandlesize (x) > sizeof (OSType);
			return false
		}
	}
	
	public var asInt: Int? {
		get {
			return 0 //TODO
		}
	}
}
