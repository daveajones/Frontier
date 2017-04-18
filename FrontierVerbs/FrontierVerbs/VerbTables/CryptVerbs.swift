//
//  CryptVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct CryptVerbs: VerbTable {
	
	private enum Verb: String {
		case whirlpool = "whirlpool"
		case hmacMD5 = "hmacmd5"
		case MD5 = "md5"
		case SHA1 = "sha1"
		case hmacSHA1 = "hmacsha1"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .whirlpool:
			return whirlpool(params)
		case .hmacMD5:
			return hmacMD5(params)
		case .MD5:
			return MD5(params)
		case .SHA1:
			return SHA1(params)
		case .hmacSHA1:
			return hmacSHA1(params)
		}
	}
}

private extension CryptVerbs {
	
	static func whirlpool(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func hmacMD5(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func MD5(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func SHA1(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func hmacSHA1(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
