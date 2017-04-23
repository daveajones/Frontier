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
		case noLongerImplemented
		
		// OrigFrontier: langinternal.h
		// TODO: finish organizing.
		
		case undefined
		
		case notEnoughParameters
		case tooManyParameters
		case unknownParameter
		case duplicateParameter
		case notVarParam
		case illegalToken
		case parserError
		case unimplementedVerb
		case badEntryPointName
		case unknownIdentifier
		case unexpectedOpCode
		case unknownFunction
		case cantDelete
		case tmpStackOverflow
		case multipleSymbol
		case notFunction
		case badReplaceContext
		case ipc
		case appNotLoaded
		
		case charOutOfRange
		case intTooLarge
		case intTooSmall
		case numberTooLarge
		case numberNotPositive
		case badRangeOperation

		case stringNotTerminated
		case stringNotBoolean
		
		case badCharConst
		
		case badAddress
		case iacAddress
		case cantEncodeAddress
		case cantDecodeAddress
		case parseAddress
		case nilAddress

		case stringChar
		case stringLong
		case floatToLong
		case osTypeCoerce
		case intCoerce
		case charCoerce
		case longCoerce
		case dateCoerce
		case stringCoerce
		case booleanCoerce
		case cantCoerceToBinary
		case binaryCoerce
		case pointCoerce
		case rectCoerce
		case rgbCoerce
		case patternCoerce
		case filespecCoerce
		case aliasCoerce
		case addressCoerce
		case floatCoerce
		case listCoerce
		case binaryTypeCoerce
		case coercionNotPossible

		case additionNotPossible
		case subtractionNotPossible
		case multiplicationNotPossible
		case divisionNotPossible
		case divideByZero
		case modulusNotPossible
		case comparisonNotPossible
		case unaryMinusNotPossible
		case unaryNotNotPossible

		case forAgentsOnly
		
		case invalidDirection
		
		case badIPCListVal
		case badIPCListPos
		
		case ipcApple
		case noSuchTable
		case notEFP
		
		case arrayNotTable
		case arrayIndex
		case arrayStringIndex
		
		case cantSize
		case tableTooSmall
		
		case cantPack
		case cantUnpack
		case unpackFormat
		case cantPackThisExternal
		
		case iacToolkitNotInitialized
		case badWithStatement
		case noPath
		
		case externalReturn
		case externalGetValue
		case externalAssign
		case badExternalOperation
		case badExternalAssignment
		case externalValueRequired

		case trapNotRunning
		
		case dialogNotRunning
		case cantLoadDialog
		case dialogItemNum
		case cantNestDialog
		
		case tooManyWithTables
		case stackOverflow
		case badOutgoingIPCType
		case cantRunCard
		case badRandomBounds
		case cantUseAlias
		case cantUseObjspec
		case badKeyForm
		case binaryRequired
		
		case notXCMD
		case notUCMD
		case notCard
		
		case cantOpenComponent
		case noComponentManager

		case badObjectSpecification
		case cantBackgroundClipboard
		case badFieldOperation
		case bitIndex
		case badNetworkVolumeSpecification
		case noFileOpen
		case fileNotOpened
		
		case semaphoreTimeout
		case badThreadID
		
		case dbNotOpened
		case dbOpenedReadOnly
		case needOpenDB
		
		case tableLoading
		case cantConnectToDLL
		case cantFindProcInfo
		case cantFindDLLFunction
		case cantFindProcInfoFunction
		case cantFindProcInfoLoad
		
		case noAttributesTable
		case cantFindAttribute
		
		case cantGetXMLAddress
		case badXMLText
		case missingXMLAttributes
		case cantDecompile
		case frontierXMLDataType
		
		case hashPack
		case hashUnpack
		case evalDirective
		case emptyDefinedDirective
		case illegalName
		case tableSaving
		case badRename
		case badWindow
		case urlSplit
		
		case cloudSpec
		case cloudElement
		
		case bitShiftDist
		
		case regexpCompile
		case regexpInvalid
		case regexpInternal
		case regexpBadGroupName
		case regexpNonexistentGroupNumber
		case regexpNonexistentGroupName
		case regexpNonExistentGroup
		case frInternal
		case frBadGroupName
		case frNonexistentGroupNumber
		case frNonExistentGroupName
		
		case replaceItem
		case cmdShellNotFound
	}
	
	public let errorType: LangErrorType
	public let lineNumber: Int?
	public let characterIndex: Int?
	public let message: String?
	
	public init(_ errorType: LangErrorType, lineNumber: Int? = nil, characterIndex: Int? = nil, message: String? = nil) {
		
		self.errorType = errorType
		self.lineNumber = lineNumber
		self.characterIndex = characterIndex
		self.message = message
	}
	
	func errorByAdding(lineNumber: Int, characterIndex: Int) -> LangError {
		
		return LangError(errorType, lineNumber: lineNumber, characterIndex: characterIndex)
	}
}
