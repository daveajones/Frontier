//
//  SysVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .osVersion:
			return osVersion(params)
		case .systemTask:
			return VerbResult.noLongerImplemented
		case .browseNetwork:
			return browseNetwork(params)
		case .appIsRunning:
			return appIsRunning(params)
		case .frontmostApp:
			return frontmostApp(params)
		case .bringAppToFront:
			return bringAppToFront(params)
		case .countApps:
			return countApps(params)
		case .getNthApp:
			return getNthApp(params)
		case .getAppPath:
			return getAppPath(params)
		case .memAvail:
			return VerbResult.noLongerImplemented
		case .machine:
			return machine(params)
		case .os:
			return os(params)
		case .getEnvironmentVariable:
			return getEnvironmentVariable(params)
		case .setEnvironmentVariable:
			return setEnvironmentVariable(params)
		case .unixShellCommand:
			return unixShellCommand(params)
		case .winShellCommand:
			return VerbResult.noLongerImplemented
		}
	}
}

private extension SysVerbs {
	
	static func osVersion(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func browseNetwork(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func appIsRunning(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func frontmostApp(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func bringAppToFront(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func countApps(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getNthApp(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getAppPath(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func machine(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func os(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getEnvironmentVariable(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func setEnvironmentVariable(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func unixShellCommand(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
