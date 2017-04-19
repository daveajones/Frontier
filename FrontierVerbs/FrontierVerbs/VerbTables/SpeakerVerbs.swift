//
//  SpeakerVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct SpeakerVerbs: VerbTable {
	
	private enum Verb: String {
		case beep = "beep"
		case sound = "sound"
		case playNamedSound = "playnamedsound"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .beep:
			return beep(params)
		case .sound:
			return sound(params)
		case .playNamedSound:
			return playNamedSound(params)
		}
	}
}

private extension SpeakerVerbs {
	
	static func beep(_ params: VerbParams) -> VerbResult {
		
		NSBeep()
		return VerbResult.verbTrue
	}

	static func sound(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	

	static func playNamedSound(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	

}
