//
//  WebserverVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .server:
			return server(params)
		case .dispatch:
			return dispatch(params)
		case .parseHeaders:
			return parseHeaders(params)
		case .parseCookies:
			return parseCookies(params)
		case .buildResponse:
			return buildResponse(params)
		case .buildErrorPage:
			return buildErrorPage(params)
		case .getServerString:
			return getServerString(params)
		}
	}
}

private extension WebserverVerbs {
	
	static func server(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func dispatch(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func parseHeaders(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func parseCookies(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func buildResponse(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func buildErrorPage(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getServerString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	

}
