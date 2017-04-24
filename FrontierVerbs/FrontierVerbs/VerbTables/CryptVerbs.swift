//
//  CryptVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct CryptVerbs: VerbTable {
	
	private enum Verb: String {
		case whirlpool = "whirlpool"
		case hmacMD5 = "hmacmd5"
		case MD5 = "md5"
		case SHA1 = "sha1"
		case hmacSHA1 = "hmacsha1"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .whirlpool:
				return try whirlpool(params)
			case .hmacMD5:
				return try hmacMD5(params)
			case .MD5:
				return try MD5(params)
			case .SHA1:
				return try SHA1(params)
			case .hmacSHA1:
				return try hmacSHA1(params)
			}
		}
		catch { throw error }
	}
}

private extension CryptVerbs {
	
	static func whirlpool(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func hmacMD5(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func MD5(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func SHA1(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func hmacSHA1(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
