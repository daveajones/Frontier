//
//  SpeakerVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct SpeakerVerbs: VerbTable {
	
	private enum Verb: String {
		case beep = "beep"
		case sound = "sound"
		case playNamedSound = "playnamedsound"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .beep:
				return try beep(params)
			case .sound:
				return try sound(params)
			case .playNamedSound:
				return try playNamedSound(params)
			}
		}
		catch { throw error }
	}
}

private extension SpeakerVerbs {
	
	static func beep(_ params: VerbParams) throws -> Value {
		
		NSBeep()
		return true
	}
	
	static func sound(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	
	static func playNamedSound(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	
}
