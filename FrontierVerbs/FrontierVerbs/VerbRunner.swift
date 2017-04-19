//
//  VerbRunner.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct VerbRunner {
	
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
	
	func run(verbName: String, params: VerbParams) -> VerbResult {
		
		let (lowerTableName, lowerVerbName) = verbNamePieces(verbName)

		guard let implementor = VerbImplementor(rawValue: lowerTableName) else {
			return VerbResult.verbNotFound
		}
		
		switch implementor {
			
		case .base64:
			return Base64Verbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .bit:
			return BitVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .clipboard:
			return ClipboardVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .clock:
			return ClockVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .crypt:
			return CryptVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .date:
			return DateVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .db:
			return DBVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .dll:
			return DLLVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .dialog:
			return DialogVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .editMenu:
			return EditMenuVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .fileMenu:
			return FileMenuVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .file:
			return FileVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .frontier:
			return FrontierVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .html:
			return HTMLVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .inetd:
			return InetdVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .kb:
			return KBVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .launch:
			return LaunchVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .lang:
			return LangVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .mainWindow:
			return MainWindowVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .math:
			return MathVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .menu:
			return MenuVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .mouse:
			return MouseVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .mrCalendar:
			return MRCalendarVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .opAttributes:
			return OPAttributesVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .op:
			return OPVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .osa:
			return OSAVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .pict:
			return PictVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .point:
			return PointVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .quickTime:
			return QuickTimeVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .rgb:
			return RGBVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .re:
			return RegexVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .rez:
			return RezVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .rectangle:
			return RectangleVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .script:
			return ScriptVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .search:
			return SearchVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .searchEngine:
			return SearchEngineVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .semaphore:
			return SemaphoreVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .speaker:
			return SpeakerVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .statusBar:
			return StatusBarVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .string:
			return StringVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .sys:
			return SysVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .table:
			return TableVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .target:
			return TargetVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .tcp:
			return TCPVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .thread:
			return ThreadVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .webserver:
			return WebserverVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .window:
			return WindowVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .wp:
			return WPVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		case .xml:
			return XMLVerbs.evaluate(lowerVerbName, params, verbAppDelegate)
		}
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
