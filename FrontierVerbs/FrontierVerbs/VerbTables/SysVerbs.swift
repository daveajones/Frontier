//
//  SysVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct SysVerbs: VerbTable {
	
	private enum Verb: String {
		case osVersion = "osversion"
		case systemTask = "systemtask"
		case browseNetwork = "browsenetwork"
		case appIsRunning = "appisrunning"
		case frontmostApp = "frontmostapp"
		case bringAppToFront = "bringapptofront"
		case countApps = "countapps"
		case getNthApp = "getnthapp"
		case getAppPath = "getapppath"
		case memAvail = "memavail"
		case machine = "machine"
		case os = "os"
		case getEnvironmentVariable = "getenvironmentvariable"
		case setEnvironmentVariable = "setenvironmentvariable"
		case unixShellCommand = "unixshellcommand"
		case winShellCommand = "winshellCommand"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .osVersion:
				return try osVersion(params)
			case .systemTask:
				return true
			case .browseNetwork:
				return try browseNetwork(params)
			case .appIsRunning:
				return try appIsRunning(params)
			case .frontmostApp:
				return try frontmostApp(params)
			case .bringAppToFront:
				return try bringAppToFront(params)
			case .countApps:
				return try countApps(params)
			case .getNthApp:
				return try getNthApp(params)
			case .getAppPath:
				return try getAppPath(params)
			case .memAvail:
				return Int.max
			case .machine:
				return try machine(params)
			case .os:
				return try os(params)
			case .getEnvironmentVariable:
				return try getEnvironmentVariable(params)
			case .setEnvironmentVariable:
				return try setEnvironmentVariable(params)
			case .unixShellCommand:
				return try unixShellCommand(params)
			case .winShellCommand:
				return false
			}
		}
		catch { throw error }
	}
}

private extension SysVerbs {
	
	static func osVersion(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func browseNetwork(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func appIsRunning(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func frontmostApp(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func bringAppToFront(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func countApps(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getNthApp(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getAppPath(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func machine(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func os(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getEnvironmentVariable(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func setEnvironmentVariable(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func unixShellCommand(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
