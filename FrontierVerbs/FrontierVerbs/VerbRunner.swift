//
//  VerbRunner.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation
import FrontierData

public struct VerbRunner {
	
	private let verbAppDelegate: VerbAppDelegate
	
	init(verbAppDelegate: VerbAppDelegate) {
		self.verbAppDelegate = verbAppDelegate
	}
	
	private enum VerbImplementor: String {
		case base64 = "base64"
		case bit = "bit"
		case clipboard = "clipboard"
		case clock = "clock"
		case crypt = "crypt"
		case date = "date"
		case db = "db"
		case dialog = "dialog"
		case dll = "dll"
		case editMenu = "editmenu"
		case fileMenu = "filemenu"
		case file = "file"
		case frontier = "frontier"
		case html = "html"
		case inetd = "inetd"
		case kb = "kb"
		case launch = "launch"
		case lang = ""
		case mainWindow = "mainwindow"
		case math = "math"
		case menu = "menu"
		case mouse = "mouse"
		case mrCalendar = "mrcalendar"
		case opAttributes = "opattributes"
		case op = "op"
		case osa = "osa"
		case pict = "pict"
		case point = "point"
		case quickTime = "quicktime"
		case rgb = "rgb"
		case rectangle = "rectangle"
		case re = "re"
		case rez = "rez"
		case script = "script"
		case search = "search"
		case searchEngine = "searchengine"
		case semaphore = "semaphore"
		case speaker = "speaker"
		case statusBar = "statusbar"
		case string = "string"
		case sys = "sys"
		case table = "table"
		case target = "target"
		case tcp = "tcp"
		case thread = "thread"
		case webserver = "webserver"
		case window = "window"
		case wp = "wp"
		case xml = "xml"
	}
	
	func run(verbName: String, params: VerbParams) throws -> Value {
		
		let (lowerTableName, lowerVerbName) = verbNamePieces(verbName)
		
		guard let implementor = VerbImplementor(rawValue: lowerTableName) else {
			throw LangError(.verbNotFound)
		}
		
		do {
			switch implementor {
				
			case .base64:
				return try Base64Verbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .bit:
				return try BitVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .clipboard:
				return try ClipboardVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .clock:
				return try ClockVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .crypt:
				return try CryptVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .date:
				return try DateVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .db:
				return try DBVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .dll:
				return try DLLVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .dialog:
				return try DialogVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .editMenu:
				return try EditMenuVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .fileMenu:
				return try FileMenuVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .file:
				return try FileVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .frontier:
				return try FrontierVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .html:
				return try HTMLVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .inetd:
				return try InetdVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .kb:
				return try KBVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .launch:
				return try LaunchVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .lang:
				return try LangVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .mainWindow:
				return try MainWindowVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .math:
				return try MathVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .menu:
				return try MenuVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .mouse:
				return try MouseVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .mrCalendar:
				return try MRCalendarVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .opAttributes:
				return try OPAttributesVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .op:
				return try OPVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .osa:
				return try OSAVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .pict:
				return try PictVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .point:
				return try PointVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .quickTime:
				return try QuickTimeVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .rgb:
				return try RGBVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .re:
				return try RegexVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .rez:
				return try RezVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .rectangle:
				return try RectangleVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .script:
				return try ScriptVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .search:
				return try SearchVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .searchEngine:
				return try SearchEngineVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .semaphore:
				return try SemaphoreVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .speaker:
				return try SpeakerVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .statusBar:
				return try StatusBarVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .string:
				return try StringVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .sys:
				return try SysVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .table:
				return try TableVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .target:
				return try TargetVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .tcp:
				return try TCPVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .thread:
				return try ThreadVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .webserver:
				return try WebserverVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .window:
				return try WindowVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .wp:
				return try WPVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			case .xml:
				return try XMLVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
			}
		}
		catch { throw error }
	}
}

private extension VerbRunner {
	
	func verbNamePieces(_ verbName: String) -> (String, String) {
		
		if verbName.contains(".") {
			let components = verbName.components(separatedBy: ".")
			return (components[0].lowercased(), components[1].lowercased())
		}
		return ("", verbName.lowercased())
	}
}
