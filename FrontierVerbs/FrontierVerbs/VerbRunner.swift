//
//  VerbRunner.swift
//  FrontierVerbs
//
//  Created by Brent Simmons on 4/12/17.
//  Copyright © 2017 Ranchero Software. All rights reserved.
//

import Foundation

struct VerbRunner {
	
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
	
	
	fileprivate let langVerbTable = LangVerbs()
	
	func run(verbName: String, params: VerbParams) -> VerbResult {
		
		let (lowerTableName, lowerVerbName) = verbNamePieces(verbName)

		guard let implementor = VerbImplementor(rawValue: lowerTableName) else {
			return VerbResult.verbNotFound
		}
		
		switch implementor {
			
		case .base64:
			return Base64Verbs.evaluate(lowerVerbName, params)
		case .bit:
			return BitVerbs.evaluate(lowerVerbName, params)
		case .clipboard:
			return ClipboardVerbs.evaluate(lowerVerbName, params)
		case .clock:
			return ClockVerbs.evaluate(lowerVerbName, params)
		case .crypt:
			return CryptVerbs.evaluate(lowerVerbName, params)
		case .date:
			return DateVerbs.evaluate(lowerVerbName, params)
		case .db:
			return DBVerbs.evaluate(lowerVerbName, params)
		case .dll:
			return DLLVerbs.evaluate(lowerVerbName, params)
		case .dialog:
			return DialogVerbs.evaluate(lowerVerbName, params)
		case .editMenu:
			return EditMenuVerbs.evaluate(lowerVerbName, params)
		case .fileMenu:
			return FileMenuVerbs.evaluate(lowerVerbName, params)
		case .file:
			return FileVerbs.evaluate(lowerVerbName, params)
		case .frontier:
			return FrontierVerbs.evaluate(lowerVerbName, params)
		case .html:
			return HTMLVerbs.evaluate(lowerVerbName, params)
		case .inetd:
			return InetdVerbs.evaluate(lowerVerbName, params)
		case .kb:
			return KBVerbs.evaluate(lowerVerbName, params)
		case .launch:
			return LaunchVerbs.evaluate(lowerVerbName, params)
		case .lang:
			return LangVerbs.evaluate(lowerVerbName, params)
		case .mainWindow:
			return MainWindowVerbs.evaluate(lowerVerbName, params)
		case .math:
			return MathVerbs.evaluate(lowerVerbName, params)
		case .menu:
			return MenuVerbs.evaluate(lowerVerbName, params)
		case .mouse:
			return MouseVerbs.evaluate(lowerVerbName, params)
		case .mrCalendar:
			return MRCalendarVerbs.evaluate(lowerVerbName, params)
		case .opAttributes:
			return OPAttributesVerbs.evaluate(lowerVerbName, params)
		case .op:
			return OPVerbs.evaluate(lowerVerbName, params)
		case .osa:
			return OSAVerbs.evaluate(lowerVerbName, params)
		case .pict:
			return PictVerbs.evaluate(lowerVerbName, params)
		case .point:
			return PointVerbs.evaluate(lowerVerbName, params)
		case .quickTime:
			return QuickTimeVerbs.evaluate(lowerVerbName, params)
		case .rgb:
			return RGBVerbs.evaluate(lowerVerbName, params)
		case .re:
			return RegexVerbs.evaluate(lowerVerbName, params)
		case .rez:
			return RezVerbs.evaluate(lowerVerbName, params)
		case .rectangle:
			return RectangleVerbs.evaluate(lowerVerbName, params)
		case .script:
			return ScriptVerbs.evaluate(lowerVerbName, params)
		case .search:
			return SearchVerbs.evaluate(lowerVerbName, params)
		case .searchEngine:
			return SearchEngineVerbs.evaluate(lowerVerbName, params)
		case .semaphore:
			return SemaphoreVerbs.evaluate(lowerVerbName, params)
		case .speaker:
			return SpeakerVerbs.evaluate(lowerVerbName, params)
		case .statusBar:
			return StatusBarVerbs.evaluate(lowerVerbName, params)
		case .string:
			return StringVerbs.evaluate(lowerVerbName, params)
		case .sys:
			return SysVerbs.evaluate(lowerVerbName, params)
		case .table:
			return TableVerbs.evaluate(lowerVerbName, params)
		case .target:
			return TargetVerbs.evaluate(lowerVerbName, params)
		case .tcp:
			return TCPVerbs.evaluate(lowerVerbName, params)
		case .thread:
			return ThreadVerbs.evaluate(lowerVerbName, params)
		case .webserver:
			return WebserverVerbs.evaluate(lowerVerbName, params)
		case .window:
			return WindowVerbs.evaluate(lowerVerbName, params)
		case .wp:
			return WPVerbs.evaluate(lowerVerbName, params)
		case .xml:
			return XMLVerbs.evaluate(lowerVerbName, params)
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
