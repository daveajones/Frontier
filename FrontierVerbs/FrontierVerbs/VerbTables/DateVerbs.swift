//
//  DateVerbs.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/15/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

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
	
	static func evaluate(_ lowerVerbName: String, _ params: VerbParams) -> VerbResult {
		
		guard let verb = Verb(rawValue: lowerVerbName) else {
			return VerbResult.verbNotFound
		}
		
		switch verb {
			
		case .get:
			return get(params)
		case .set:
			return set(params)
		case .abbrevString:
			return abbrevString(params)
		case .dayOfWeek:
			return dayOfWeek(params)
		case .daysInMonth:
			return daysInMonth(params)
		case .dayString:
			return dayString(params)
		case .firstOfMonth:
			return firstOfMonth(params)
		case .lastOfMonth:
			return lastOfMonth(params)
		case .longString:
			return longString(params)
		case .nextMonth:
			return nextMonth(params)
		case .nextWeek:
			return nextWeek(params)
		case .nextYear:
			return nextYear(params)
		case .prevMonth:
			return prevMonth(params)
		case .prevWeek:
			return prevWeek(params)
		case .prevYear:
			return prevYear(params)
		case .shortString:
			return shortString(params)
		case .tomorrow:
			return tomorrow(params)
		case .weeksInMonth:
			return weeksInMonth(params)
		case .yesterday:
			return yesterday(params)
		case .getCurrentTimeZone:
			return getCurrentTimeZone(params)
		case .netStandardString:
			return netStandardString(params)
		case .monthToString:
			return monthToString(params)
		case .dayOfWeekToString:
			return dayOfWeekToString(params)
		case .versionLessThan:
			return versionLessThan(params)
		case .day:
			return day(params)
		case .month:
			return month(params)
		case .year:
			return year(params)
		case .hour:
			return hour(params)
		case .minute:
			return minute(params)
		case .seconds:
			return seconds(params)
		}
	}
}

private extension DateVerbs {
	
	static func get(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func set(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func abbrevString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func dayOfWeek(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func daysInMonth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func dayString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func firstOfMonth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func lastOfMonth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func longString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func nextMonth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func nextWeek(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func nextYear(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func prevMonth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func prevWeek(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func prevYear(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func shortString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func tomorrow(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func weeksInMonth(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func yesterday(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func getCurrentTimeZone(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func netStandardString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func monthToString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func dayOfWeekToString(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func versionLessThan(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func day(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}

	static func month(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func year(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func hour(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func minute(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
	
	static func seconds(_ params: VerbParams) -> VerbResult {
		
		return VerbResult.notImplemented
	}
}
