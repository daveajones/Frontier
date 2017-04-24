//
//  DateVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

struct DateVerbs: VerbTable {
	
	private enum Verb: String {
		case get = "get"
		case set = "set"
		case abbrevString = "abbrevstring"
		case dayOfWeek = "dayofweek"
		case daysInMonth = "daysinmonth"
		case dayString = "daystring"
		case firstOfMonth = "firstofmonth"
		case lastOfMonth = "lastofmonth"
		case longString = "longstring"
		case nextMonth = "nextmonth"
		case nextWeek = "nextweek"
		case nextYear = "nextyear"
		case prevMonth = "prevmonth"
		case prevWeek = "prevweek"
		case prevYear = "prevyear"
		case shortString = "shortstring"
		case tomorrow = "tomorrow"
		case weeksInMonth = "weeksinmonth"
		case yesterday = "yesterday"
		case getCurrentTimeZone = "getcurrenttimezone"
		case netStandardString = "netstandardstring"
		case monthToString = "monthtostring"
		case dayOfWeekToString = "dayofweektostring"
		case versionLessThan = "versionlessthan"
		case day = "day"
		case month = "month"
		case year = "year"
		case hour = "hour"
		case minute = "minute"
		case seconds = "seconds"
	}
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams, _ verbAppDelegate: VerbAppDelegate) throws -> Value {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch verb {
				
			case .get:
				return try get(params)
			case .set:
				return try set(params)
			case .abbrevString:
				return try abbrevString(params)
			case .dayOfWeek:
				return try dayOfWeek(params)
			case .daysInMonth:
				return try daysInMonth(params)
			case .dayString:
				return try dayString(params)
			case .firstOfMonth:
				return try firstOfMonth(params)
			case .lastOfMonth:
				return try lastOfMonth(params)
			case .longString:
				return try longString(params)
			case .nextMonth:
				return try nextMonth(params)
			case .nextWeek:
				return try nextWeek(params)
			case .nextYear:
				return try nextYear(params)
			case .prevMonth:
				return try prevMonth(params)
			case .prevWeek:
				return try prevWeek(params)
			case .prevYear:
				return try prevYear(params)
			case .shortString:
				return try shortString(params)
			case .tomorrow:
				return try tomorrow(params)
			case .weeksInMonth:
				return try weeksInMonth(params)
			case .yesterday:
				return try yesterday(params)
			case .getCurrentTimeZone:
				return try getCurrentTimeZone(params)
			case .netStandardString:
				return try netStandardString(params)
			case .monthToString:
				return try monthToString(params)
			case .dayOfWeekToString:
				return try dayOfWeekToString(params)
			case .versionLessThan:
				return try versionLessThan(params)
			case .day:
				return try day(params)
			case .month:
				return try month(params)
			case .year:
				return try year(params)
			case .hour:
				return try hour(params)
			case .minute:
				return try minute(params)
			case .seconds:
				return try seconds(params)
			}
		}
		catch { throw error }
	}
}

private extension DateVerbs {
	
	static func get(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func set(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func abbrevString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func dayOfWeek(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func daysInMonth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func dayString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func firstOfMonth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func lastOfMonth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func longString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func nextMonth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func nextWeek(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func nextYear(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func prevMonth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func prevWeek(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func prevYear(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func shortString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func tomorrow(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func weeksInMonth(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func yesterday(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func getCurrentTimeZone(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func netStandardString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func monthToString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func dayOfWeekToString(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func versionLessThan(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func day(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func month(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func year(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func hour(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func minute(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
	
	static func seconds(_ params: VerbParams) throws -> Value {
		
		throw LangError(.unimplementedVerb)
	}
}
