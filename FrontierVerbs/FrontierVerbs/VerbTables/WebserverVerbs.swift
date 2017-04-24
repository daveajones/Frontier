//
//  WebserverVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct WebserverVerbs: VerbTable {
	
	private enum Verb: String {
		case server = "server"
		case dispatch = "dispatch"
		case parseHeaders = "parseheaders"
		case parseCookies = "parsecookies"
		case buildResponse = "buildresponse"
		case buildErrorPage = "builderrorpage"
		case getServerString = "getserverstring"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .server:
				return try server(params)
			case .dispatch:
				return try dispatch(params)
			case .parseHeaders:
				return try parseHeaders(params)
			case .parseCookies:
				return try parseCookies(params)
			case .buildResponse:
				return try buildResponse(params)
			case .buildErrorPage:
				return try buildErrorPage(params)
			case .getServerString:
				return try getServerString(params)
			}
		}
		catch { throw error }
	}
}

private extension WebserverVerbs {
	
	static func server(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func dispatch(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func parseHeaders(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func parseCookies(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func buildResponse(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func buildErrorPage(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getServerString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	
}
