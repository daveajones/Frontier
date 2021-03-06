
/*	$Id: shell.c 1701 2007-06-30 20:13:42Z creecode $    */

/******************************************************************************

    UserLand Frontier(tm) -- High performance Web content management,
    object database, system-level and Internet scripting environment,
    including source code editing and debugging.

    Copyright (C) 1992-2004 UserLand Software, Inc.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

******************************************************************************/

#include "frontier.h"
#include "standard.h"
#include "mac.h"
#include "land.h"
#include "player.h" /*7.0b4 PBS*/
#include "frontierconfig.h"
#include "about.h"
#include "cursor.h"
#include "dialogs.h"
#include "error.h"
#include "font.h"
#include "kb.h"
#include "launch.h"
#include "mac.h"
#include "memory.h"
#include "menu.h"
#include "mouse.h"
#include "ops.h"
#include "quickdraw.h"
#include "search.h"
#include "scrap.h"
#include "smallicon.h"
#include "strings.h"
#include "timedate.h"
#include "frontierwindows.h"
#include "zoom.h"
#include "file.h"
#include "resources.h"
#include "shell.h"
#include "shellbuttons.h"
#include "shellmenu.h"
#include "shellhooks.h"
#include "shell.rsrc.h"
#include "shellprint.h"
#include "shellundo.h"
#include "shellprivate.h"
#define __APPLEEVENTS__
#include "lang.h"
#include "langipc.h"
#include "process.h"
#include "kernelverbs.h"
#include "scripts.h"
#include "tablestructure.h"
#include "wpengine.h"
#include "frontierdebug.h" /*6.2b7 AR*/
#include "dockmenu.h"
#include "services.h"
#include "MacSocketNetEvents.h"
#include "langdll.h" /*2004-11-29 aradke: for dllinitverbs*/

#ifdef flcomponent
	#include "osacomponent.h"
#endif

#ifdef fliowa
	#include "iowaverbs.h" /*3/18/92 dmb*/
#endif

#ifdef iowaRuntime
	#include "iowainit.h"
#endif

EventRecord shellevent; /*the last event received by the shell*/

WindowPtr shellwindow = nil; /*the window whose globals are currently loaded*/

hdlwindowinfo shellwindowinfo = nil; /*the windowinfo record for the globals*/

//changed this to nil to prevent the idler routine from firing
//until they are installed.
tyshellglobals shellglobals; /*holds the globals, callback pointers, everything*/


static boolean flexitmaineventloop = false;

static boolean flshellimmediatebackground = false; /*service the background queue immediately*/

static unsigned long timelastevent = 0; /*the timestamp, last event received*/

static unsigned long timenextbackground = 0;

static Point adjustcursorlastpoint = {-1, -1}; /*optimizes adjustcursor routine*/

static boolean floverridebeachball = false; /*set true when user action occurs*/

static boolean flipcstarted = false;

static boolean flbackgroundtasksdisabled = true; /*will be set to false when initialization is complete*/

static boolean flshelleventposted = false;


boolean shellgetstring (short id, bigstring bs) {
	
	return (getstringlist (interfacelistnumber, id, bs));
	} /*shellgetstring*/


void shellerrormessage (bigstring bs) {
	
	/*
	all normal error messages -- memory, i/o, resource -- go through 
	here.  this allows errors to be rechannelled, for instance to the 
	langerror dialog window.
	*/
	
	if (!shellcallerrorhooks (bs))
		return;
	
	flbackgroundtasksdisabled = true; /*error condition, don't want modal backgrounding*/
	
	alertdialog (bs);

	flbackgroundtasksdisabled = false;
	} /*shellerrormessage*/


#ifdef fldebug

void shellinternalerrormessage (bigstring bserror) {
	
	bigstring bs;
	
	copystring ((ptrstring) "\x10" "Internal error: ", bs);
	
	pushstring (bserror, bs);
	
	shellerrormessage (bs);
	} /*shellinternalerrormessage*/

#else

void shellinternalerrormessage (short iderror) {
	
	bigstring bs, bsnum;
	
	shellgetstring (internalerrorstring, bs);
	
	numbertostring (iderror, bsnum);
	
	parsedialogstring (bs, bsnum, nil, nil, nil, bs);
	
	shellerrormessage (bs);
	} /*shellinternalerrormessage*/

#endif


extern void shellshutdownscroll ();


boolean shellshutdown (void) {
	
	/*
	4/30/91 dmb: write out scrap before exiting
	
	1/3/92 dmb: commented-out the Quit dialog
	
	3.0b15 dmb: if fldialog is false, don't verify component shutdown; 
	they have no choice.
	*/
	
	if (!shellcloseall (nil, false))
		return (false);
	
	shellwritescrap (anyscraptype);
	
	#ifdef iowaRuntime
	
		iowaClose ();
	
	#endif
	
	if (flipcstarted)
		langipcshutdown ();
	
	#ifdef flcomponent
		
		osacomponentshutdown ();
		
	#endif
	
		fwsNetEventQuit ();
	
	processclose ();
	
	logshutdown ();
	
	//Code change by Timothy Paustian Wednesday, July 26, 2000 9:24:46 PM
	//added code to free action procs for scroll bars.
		shellshutdownscroll();
		fileshutdown();
		UnregisterAppearanceClient();

	exittooperatingsystem (); /*doesn't return*/
	
	return (true); /*satisfy the compiler -- not a void function*/
	} /*shellshutdown*/


boolean shellquit (void) {
	
	#ifdef flcomponent
		
		if (!osacomponentverifyshutdown ()) /*may return false if there are clients*/
			return (false);
	
	#endif
	
	if (!shellcloseall (nil, true)) /*user hit Cancel button in save dialog*/
		return (false);
	
	shellexitmaineventloop (); //sets flag for next iteration
	
	return (true);
	} /*shellquit*/


static void shellhandleevent (void) {
	
	/*
	12/6/96 dmb: let shellhandlemouse call mousedown itself
	*/
	
	register WindowPtr w = (WindowPtr) shellevent.message;
	
	switch (shellevent.what) {
	
		case keyDown: case autoKey:
			//shellforcemenuadjust (); /*RAB 01/31/01: not needed, was a performance hit.*/
			
			floverridebeachball = true; /*beachball must be reset after user action*/
			
			if (!shellcalleventhooks (&shellevent, getfrontwindow ()))
				break;
			
			shellhandlekeystroke ();
			
			break;
		
		case mouseDown:
			//shellforcemenuadjust (); /*RAB 01/31/01: not needed, was a performance hit.*/
			
			floverridebeachball = true; /*beachball must be reset after user action*/
			
			shellhandlemouse ();
		   	
			break;
		
		case mouseUp:
			shellhandlemouseup ();
			
			break;

		case activateEvt:
			shellforcemenuadjust ();

			if (!shellcalleventhooks (&shellevent, w))
				break;
			
			shellactivatewindow (w, (shellevent.modifiers & activeFlag) != 0);
			
			break;
		
		case jugglerEvt:
			shellcalleventhooks (&shellevent, getfrontwindow ());
			
			shellhandlejugglerevent ();
			
			break;
		
		case updateEvt:
			if (!shellcalleventhooks (&shellevent, w))
				break;
			
			shellhandleupdate ();
			
			break;

		case diskEvt:
			//Code change by Timothy Paustian Friday, June 16, 2000 2:22:47 PM
			//Changed to Opaque call for Carbon

			break;
			
		default:
			shellcalleventhooks (&shellevent, nil); /*don't pass specific window for other events*/
			
			break;
		} /*switch*/
	} /*shellhandleevent*/


void shellforcecursoradjust (void) {
	
	adjustcursorlastpoint.h -= 100;
	} /*shellforcecursoradjust*/


void shelladjustcursor (void) {
	
	/*
	assumes the globals for the front window have been pushed.
	
	10/3/92 dmb: check for nil windowinfo instead of emptywindowlist
	
	5/20/92 dmb: if processbusy, don't touch the cursor
	
	1/26/93 dmb: make check of 5/92 smarter; check for beachball specifically, 
	and roll it if active
	
	2/9/93 dmb: make check of 1/26 a little smarter too: check for user action

	5.0a8 dmb: rewrote using new getmousewindowposition, so we get right cursor
	shape in non-front windows for non-Mac OSs
	*/
	
	register hdlwindowinfo hw;
	WindowPtr w;
	Point pt;
	boolean flnotfrontwindow;
	
	getmousewindowpos (&w, &pt);
	
	if (equalpoints (pt, adjustcursorlastpoint)) /*mouse hasn't moved, save cycles*/
		return;
	
	if (processbusy () && beachballcursor ()) { /*a script started the beachball rolling*/
		
		if (!floverridebeachball) { /*user action hasn't intervened*/
			
			rollbeachball ();
			
			return;
			}
		}
	
	floverridebeachball = false; /*clear flag every time -- setting cursor will stop beachball*/
	
	adjustcursorlastpoint = pt; /*remember for next call*/
	
	if (w == nil || !isshellwindow (w)) { /*not over a window, or desk accessory or special window in front*/
		
			setcursortype (cursorisarrow);
		
		return;
		}
	
	flnotfrontwindow = shellwindow != w; /*not over the front shell window*/

		if (flnotfrontwindow) {

			setcursortype (cursorisarrow);
			
			return;
			}
	
	if (flnotfrontwindow)
		shellpushglobals (w);
	
	hw = shellwindowinfo;

	if (pointinrect (pt, (**hw).contentrect)) {
		
		(*shellglobals.adjustcursorroutine) (pt);
		}
	
	else if (pointinrect (pt, (**hw).buttonsrect)) {
		
		shellbuttonadjustcursor (pt);
		}
	
	else {
		/* Under Windows, if it is not in our content - don't changeit */
			setcursortype (cursorisarrow); /*not a special cursor*/
		}
	
	if (flnotfrontwindow) /*not over the front shell window*/
		shellpopglobals ();
	
	} /*shelladjustcursor*/


void shellidle (void) {
	
	(*shellglobals.idleroutine) ();
	} /*shellidle*/


boolean shellyield (boolean flresting) {
	
	/*
	5.0.2b6 dmb: this could end up begin a generally-useful routine, 
	but right now it's being written for opening edit windows under WinOS, 
	to allow for overlapping edit calls. We're yielding to allow the main
	thread to get a WM_CREATE message.
	*/

	boolean fl;
	
	if (flscriptrunning)
		fl = langerrorenabled () && langbackgroundtask (flresting);
	else
		fl = processyield ();

	return (fl);
	} /*shellyield*/


void shellforcebackgroundtask (void) {
	
	/*
	make sure that we run background tasks at the earliest opportunity
	*/
	
	flshellimmediatebackground = true;
	} /*shellforcebackgroundtask*/


boolean shellbackgroundtask (void) {
	
	/*
	anyway.  this is called from the main event loop, and can be called by any
	code whenever you want to make sure that background UserLand tasks get a 
	shot at running....
	*/
	
	unsigned long tc;
	
	if (flbackgroundtasksdisabled)
		return (true);
	
	tc = gettickcount ();
	
	if (flshellimmediatebackground) {
		
		flshellimmediatebackground = false; /*must be reset every time*/
		}
		
	else {
		if ((tc < timenextbackground) && (timenextbackground - tc < 60)) {
			
			#ifdef MACVERSION
				return (processyield ());
			#endif
			}

		if (tc < (timelastkeystroke + 15) && (tc > timelastkeystroke)) /*heuristic -- the user is busy typing*/
			return (true);
		}
	
	timenextbackground = tc + 60; /*check task queue no more often than once a second*/
	
	if (shellpushdefaultglobals ()) {
		
		(*shellglobals.backgroundroutine) ();
		
		shellpopglobals ();
		}
	
	shellforcecursoradjust (); /*a script is allowed to change the cursor*/
	
	return (true);
	} /*shellbackgroundtask*/
	

boolean shellprocessevent (EventRecord *ev) {
	
	/*
	called externally, we process an event fielded elsewhere (within IAC TK)

	5.0.2 rab: set shellevent after grabbing threadglobals
	*/
	
	shellevent = *ev;
	
	shellhandleevent ();
	return (true);
	} /*shellprocessevent*/


boolean shellpostevent (EventRecord *ev) {
	
	/*
	9/25/92 dmb: this is being thrown in to support the HyperCard 2.0 event 
	callback in langxcmd.c. the mechanism is informal right now; we're not 
	checking to see if events are blocked, or if the particular event type is 
	currently being masked out. so there are probably bug scenarios in this 
	somewhere, but I think the odds are with us on it working reasonably well.
	
	btw, if the caller is in another thread, it must yield before the event 
	will be processed.
	*/
	
	if (flshelleventposted) /*can't stack up these calls*/
		return (false);
	
	shellevent = *ev;
	
	flshelleventposted = true;
	
	return (true);
	} /*shellpostevent*/

	
static short shellgeteventmask (void) {
	
	return (everyEvent - shellblockedevents ());
	} /*shellgeteventmask*/

static boolean shellgetevent (void) {
	
	/*
	return true if an operating system event is available in the shellevent global,
	false if no event is available.
	
	6/27/91 dmb: we're now doing more intelligent stuff with high-level events 
	on system 7, so we only want to call landeventfilter here for null events 
	to cover system 6.
	
	2/11/92 dmb: set sleep to a larger number when we're not active so we don't 
	hog the processor
	*/
	
	register boolean fl;
	register unsigned long sleep;
	boolean flcloseallwindows;
	extern boolean isModelessCardEvent (EventRecord *, boolean *);	// can't #include iowaruntime.h here

	
	if (shelleventsblocked ()) /*all events are blocked -- don't ask the OS for any*/
		return (false);
	
	if (flshelleventposted) {
		
		flshelleventposted = false; /*consumed*/
		
		fl = true;
		}
	else {
		
		if (shellisactive () || flshellimmediatebackground || processrunning ())
			sleep = 1;
		else
			sleep = min (30, maxint (1, (long) timenextbackground - gettickcount () - 20));
		
		fl = WaitNextEvent (shellgeteventmask (), &shellevent, sleep, nil);
		
			if (isplayerevent ()) /*7.0b4 PBS: QuickTime catches some events.*/
		
				fl = false;
				}
	if (flipcstarted && !fl)
		if (landeventfilter (&shellevent)) /*event consumed by IAC toolkit*/
			fl = false;
	
		if (isModelessCardEvent (&shellevent, &flcloseallwindows)) {
			
			fl = false;
			
			if (flcloseallwindows)	// user option-clicked in close box of a card window
				shellcloseall (nil, true);
			}
	
	return (fl);
	} /*shellgetevent*/

static boolean shelleventavail (void) {
	
	EventRecord ev;
	
	if (shelleventsblocked ()) /*all events are blocked -- don't ask the OS for any*/
		return (false);
	
	if (EventAvail (shellgeteventmask (), &ev))
		return (true);
	
	#ifdef landinclude
		if (flipcstarted)
			landeventfilter (&ev); /*event consumed by IAC toolkit*/
	#endif
	
	return (false);
	} /*shelleventavail*/


static void shellhandlenullevent (boolean * flbackground) {

	/*
	5.0b9 dmb: update menus even when there's nothing open
	*/

	unsigned long tc;
	boolean fl;

	tc = gettickcount ();
	
		fl = shellpushfrontglobals () || shellpushfrontrootglobals ();
		
		if (tc > (timelastevent + tickstoupdatemenus)) 
			shellupdatemenus (); 
		
		if (fl && (*shellglobals.dataholder != NULL)) { // 5.6.97 dmb: window has content

			if (tc > (timelastevent + tickstoidle)) {
				
				if (fl)
					shellidle ();
       			
				shelladjustcursor ();
        		
				*flbackground = true;
				}
			}
		
		if (fl)
			shellpopglobals ();
	
	processchecktimeouts ();
	
	if (*flbackground || flshellimmediatebackground)
		shellbackgroundtask ();
	else
	{
		int i = 0;
		i++;
	}
	shellcheckdirtyscrollbars (); /*scroll pos may change in background too*/
	} /*shellhandlenullevent*/


boolean shelleventloop (callback breakproc) {
	
	/*
	sit in an event loop, responding to the user's input.  if our breakproc
	routine returns false, we break out immediately.  this allows callers to
	view the evenloop as a co-routine.  necessary for the implementation of
	the script debugger.
	
	8/21/90 dmb:  check background task, scrollbars in one place, whether or 
	not there was an event
	*/
	
	boolean flbackground = false;

	while (true) {
		
		if (!(*breakproc) ()) /*caller is forcing us out of event loop*/
			return (true);
		
		if (shellgetevent ()) { /*if true, global shellevent holds event info*/
			
			shellhandleevent ();
						
			timelastevent = gettickcount ();
			}
		
		//Code change by Tim Paustian
		//we are going to use a timer to 
		//handle these things so we don't want them
		//in carbon
		fwsNetEventCheckAndAcceptSocket ();
		shellhandlenullevent (&flbackground);
		} /*while*/
	} /*shelleventloop*/


static boolean shellshortbreakproc (void) {
	
	return (shelleventavail ());
	} /*shellshortbreakproc*/


boolean shellshorteventloop (void) {
	
	/*
	handle all events, as long as events are available.  allows the user to 
	interact with the environment while a script is active.  very interesting!
	*/
	
	assert (iscurrentapplication (langipcself));	// 4.1b6 dmb: was checking infrontierthread.
	
	return (shelleventloop (&shellshortbreakproc));
	} /*shellshorteventloop*/


boolean shellpartialeventloop (short desiredevents) {
	
	/*
	handle all activate and update events, as long as events are available.
	*/
	
	register boolean fl;
	
	shellpushblock (everyEvent - desiredevents, true);
	
	fl = shellshorteventloop ();
	
	shellpopblock ();
	
	return (fl);
	} /*shellpartialeventloop*/


static boolean shellmainbreakproc (void) {
	
	/*
	allows us to insert a little housekeeping in the main event loop.
	*/
	
	keyboardclearescape (); /*consume any un-handled cmd-periods*/
	
	return (!flexitmaineventloop); /*keep going through the loop*/
	} /*shellmainbreakproc*/


void shellmaineventloop (void) {
	
	/*
	4/7/97 dmb: no longer do startup here

	5.0a22 dmb: need thread globals to shutdown
	*/
	
	shelleventloop (&shellmainbreakproc);
	
	shellshutdown ();
	} /*shellmaineventloop*/


void shellexitmaineventloop (void) {
	
	/*
	call this to force the program to exit the next time it hits the 
	main event loop
	*/
	
	flexitmaineventloop = true;
	} /*shellexitmaineventloop*/


boolean shellstart (void) {
	
	/*
	4/7/97 dmb: broke code out of shellmaineventloop
	*/

	shellpatchnilroutines (); /*make sure that all nil handlers point to something*/
	
	shellloadbuttonlists (); /*for windows types that have buttons attached*/
	
	shellinithandlers (); /*call the initroutines for all window types*/
	
	if (keyboardescape ()) /*give user chance to abort booting process*/
		shellshutdown ();
		
	drawmenubar (); /*don't show menubar until it is available*/

	#if TARGET_API_MAC_CARBON == 1 /*OS X PBS: delete Preferences and separator menu items.*/
	
		{
	
		MenuRef hmenu;
		long itemIndex = 1;
		OSErr err = noErr;
		
		err = GetIndMenuItemWithCommandID (NULL, kHICommandPreferences, 1, &hmenu, (MenuItemIndex*) &itemIndex);
	
		if (err == noErr) {
			deletemenuitem (hmenu, itemIndex);
			deletemenuitem (hmenu, itemIndex);
			} /*if*/
	
		}
	
	#endif
		
	shelladjustmenus ();
	
	flbackgroundtasksdisabled = false; /*ready to multitask!*/

	return (true);
	} /*shellstart*/


static boolean showerrorandexit (short iderror) {
	
	alertstring (iderror);
	
	return (false);
	} /*showerrorandexit*/


extern void shellinitscroll ();


boolean shellinit (void) {
	
	if (!initmacintosh ())
		return (showerrorandexit (notenoughmemorystring));

		initfsdefault (); /* 2005-07-18 creedon, karstenw - init fsdefault here, don't leave it up to an
					   FSMakeFSSpec call at some unknown time, see
					   < http://sourceforge.net/tracker/index.php?func=detail&aid=1239991&group_id=120666&atid=687798 > */
		
	if (keyboardescape ()) /*check for command-period for accidental launch*/
		return (false);
	
	langipcinit (); /*must do first to allow permanant event hook to be installed*/
	
	clearbytes (&globalsarray, sizeof (globalsarray));
	
	initfile (); /*do this before about to filegetprogramversion will work*/

	initquickdraw ();
	
	initfonts ();

	initconfig (); 
	
	initerror ();
	
	zoominit ();
	
	initdialogs ();
	
	initscrollbars (); /*7.0b18 PBS*/
	
	initmouse ();

	FastInitialize(); /*2005-01-14 aradke: init timer, may take up to a second to callibrate*/

	initmenusystem ();
	
	initsmallicons ();
	
	initstrings ();
	
	initundo ();
	
	initscrap ();
	
	if (!shellinitmenus ()) { /*the resource fork is damaged or possibly already open*/
		
		sysbeep ();
		
		return (false);
		}
	
	//RAB: 1/19/98 moved printing init to the bottom of the chain
	//shellinitprint (); /*get set up for printing*/
	
	initsearch ();
	
	initservices ();

#if isFrontier || winhybrid

	initlang (); /*init callbacks and other basic inits*/

	langcallbacks.processeventcallback = &shellprocessevent; /*4.1b13 dmb - new*/
	
	if (!inittablestructure ()) /*create initial hashtable structure*/
		return (false);
	
	initscripts (); /*set up global debugger data*/
	
	langinitverbs ();
	
	dbinitverbs (); // 4.1b4 dmb
	
	shellinitverbs ();
	
	fileinitverbs (); 
	
	stringinitverbs (); 
	
	windowinitverbs ();
	
	xmlinitverbs ();
	
	htmlinitverbs ();
	
#ifdef flregexpverbs
	regexpinitverbs (); /* 2003-04-23 AR: langregexp.c */
#endif
	
#ifdef MACVERSION /*7.0b4 PBS: initialize QuickTime verbs*/
	
	quicktimeinitverbs ();
	
#endif
	
	mathinitverbs (); /*2004-12-30 smd: langmath.c*/
	
	dllinitverbs (); /*2004-11-29 aradke: langdll.c*/
	
	cryptinitverbs (); /* 2006-03-07 creedon: langcrypt.c */
	
	if (keyboardescape ()) /*check again before landinit; after this, must do shellquit*/
		exittooperatingsystem ();
	
	flipcstarted = langipcstart ();
	
	initprocess ();

	//RAB: 1/19/98 - moved print init here so that Windows will have enough setup before using the dialog.
	shellinitprint (); /*get set up for printing*/

#else

	flipcstarted = langipcstart ();

#endif

	//Code change by Timothy Paustian Wednesday, July 26, 2000 9:23:50 PM
	//added init code for scroll proc

	#if TARGET_API_MAC_CARBON == 1
	
		shellinitscroll();
		//Ok we now need to set up a timer for handling idle and network processes
		{
		//EventLoopRef 		mainLoop;
		//EventLoopTimerUPP	timerUPP;
		//EventLoopTimerRef	theTimer;
		//OSStatus			anErr = noErr;
		
		//get a reference to the main loop
		//this is where we will handle the timer from
		//mainLoop = GetMainEventLoop();
		//create a UPP to the routine idleTimer that will actually do our stuff
		//timerUPP = NewEventLoopTimerUPP(idleTimer);
		/*anErr = InstallEventLoopTimer(	mainLoop,
										5 * kEventDurationSecond, //how long till it fires, do we need this
										kEventDurationSecond/6, //this fire 10 times a second as the idle proc wants.
										timerUPP,
										NULL,
										&theTimer);*/
										
	/*Install dock menu handler.*/
		
	EventHandlerUPP dockmenuUPP;										
	OSStatus ec = noErr;
	EventTypeSpec eventTypes [1];

	eventTypes[0].eventClass = kEventClassApplication;
	eventTypes[0].eventKind  = kEventAppGetDockTileMenu;

	dockmenuUPP = NewEventHandlerUPP (dockmenuhandler);

	ec = InstallApplicationEventHandler (dockmenuUPP, 1, eventTypes, NULL, NULL);

	/*If it fails, oh well, there's nothing to be done. So ec isn't checked.*/
	}
    
	#endif

	fileinit();
	return (true);

	} /*shellinit*/

#if 0 //TARGET_API_MAC_CARBON == 1
static pascal void idleTimer (EventLoopTimerRef theTimer, void * userData)
{
	//I hate warnings, shut up the compiler
	#pragma unused(theTimer)
	#pragma unused(userData)
	
	boolean flbackground;
	
	fwsNetEventCheckAndAcceptSocket ();
		
	shellhandlenullevent (&flbackground);
	
}
#endif

