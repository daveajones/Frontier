//
//  LangError.swift
//  FrontierData
//
//  Created by Brent Simmons on 4/20/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

public struct LangError: Error {
	
	public enum LangErrorType {
		case verbNotFound
		case tooManyParams
		case tooFewParams
		case notImplemented
		case noLongerImplemented
	}
	
	public let errorType: LangErrorType
	public let lineNumber: Int?
	public let characterIndex: Int?
	
	public init(_ errorType: LangErrorType, lineNumber: Int? = nil, characterIndex: Int? = nil) {
		
		self.errorType = errorType
		self.lineNumber = lineNumber
		self.characterIndex = characterIndex
	}
	
	func errorByAdding(lineNumber: Int, characterIndex: Int) -> LangError {
		
		return LangError(errorType, lineNumber: lineNumber, characterIndex: characterIndex)
	}
}
