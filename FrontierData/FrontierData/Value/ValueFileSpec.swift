//
//  ValueFileSpec.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/22/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

extension FileSpec: Value {
	
	public var valueType: ValueType {
		get {
			return .fileSpec
		}
	}
	
	public var asBool: Bool? {
		get {
//			bigstring bs;
//			
//			getfsfile ( *( *v ).data.filespecvalue, bs ); // 3/7/97 dmb
//			
//			fl = ! isemptystring (bs);
			return true
		}
	}

	public var asInt: Int? {
		get {
			return 0 //TODO
		}
	}
}
