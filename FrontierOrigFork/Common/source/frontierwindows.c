
/*	$Id: frontierwindows.c 1171 2006-03-29 02:00:53Z sethdill $    */

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
#include "quickdraw.h"
#include "strings.h"
#include "threads.h"
#include "frontierwindows.h"
#include "shell.h"




WindowPtr getnewwindow (short id, boolean fldialog, Rect *r) {

	WindowPtr w = nil;
	
	//code change by Timothy Paustian 9/17/00 dialogPtrs and WindowPtrs
	//are not the save thing. Do a cast
	//This may cause trouble in other things that assume DialogPtrs
	//and WindowPtrs are the same, but I have to return a windowPtr
	//If needed this can be cast down to a DialogPtr
	if (fldialog)
	{
		DialogPtr	theDial = GetNewDialog (id, nil, (WindowRef) -1L);
		w = GetDialogWindow(theDial);
	}
	else {
		if (config.flcolorwindow)
			w = GetNewCWindow (id, nil, (WindowPtr) -1L); 
		else
			w = GetNewWindow (id, nil, (WindowPtr) -1L); 
		}

	if (w != nil && r != nil) {

		constraintodesktop (w, r);
		
		/*make sure top-right corner (zoom box) is accessable*/ {
		
			Rect rmin;
			
			setrect (&rmin, (*r).top, (*r).right - 50, (*r).top + 5, (*r).right);
			
			if (constraintoscreenbounds (w, false, &rmin))
				constraintoscreenbounds (w, false, r);
			}
		
		sizewindow (w,  (*r).right - (*r).left, (*r).bottom - (*r).top);
		
		movewindow (w, (*r).left, (*r).top);
		}

	return (w);
	} /*getnewwindow*/

	
void disposewindow (WindowPtr w) {
	
	DisposeWindow (w);
	} /*disposewindow*/


void windowgettitle (WindowPtr w, bigstring bs) {
	
	GetWTitle (w, bs);
 	} /*windowgettitle*/
	

void windowsettitle (WindowPtr w, bigstring bs) {
	
	bigstring bsorig;
	
	GetWTitle (w, bsorig);
	
	if (!equalstrings (bs, bsorig)) /*save a little flickering*/
		SetWTitle (w, bs);
	} /*windowsettitle*/
	

void windowinval (WindowPtr w) {
	
	Rect r;

	getlocalwindowrect (w, &r);

	invalwindowrect (w, r);
	} /*windowinval*/


boolean graywindow (WindowPtr w) {
	
	Rect r;
	pushwindowport(w);
	getlocalwindowrect (w, &r);
	
	grayrect (r);
	
	invalrect (r);
	
	popport ();

	return (true);
	} /*graywindow*/
	
void movewindow (WindowPtr w, short h, short v) {

	MoveWindow (w, h, v, false); /*don't bring it to the front*/
	} /*movewindow*/


void movewindowhidden (WindowPtr w, short h, short v) {

	MoveWindow (w, h, v, false); /*don't bring it to the front*/
	} /*movewindowhidden*/
	

void sizewindow (WindowPtr w, short h, short v) {

	SizeWindow (w, h, v, true); /*add to the update region*/
	} /*sizewindow*/

	
void sizewindowhidden (WindowPtr w, short h, short v) {

	SizeWindow (w, h, v, true); /*add to the update region*/
	} /*sizewindowhidden*/


void moveandsizewindow (WindowPtr w, Rect r) {
	
	sizewindow (w, r.right - r.left, r.bottom - r.top);
	
	movewindow (w, r.left, r.top);
	} /*moveandsizewindow*/


WindowPtr getfrontwindow (void) {
	
	/*
	5.1.5b15 dmb: return invisible window if in front, not NULL [Win]
	*/

	return (FrontWindow ());
	} /*getfrontwindow*/


WindowPtr getnextwindow (WindowPtr w) {
	
	return GetNextWindow(w);
	} /*getfrontwindow*/


boolean windowbringtofront (WindowPtr w) {
	
	if (w == nil)
		return (false);
	
	SelectWindow (w);
	shellwindowmenudirty (); /*the checked item changes*/
	
	return (true);
	} /*windowbringtofront*/


boolean windowsendtoback (WindowPtr w) {

	if (w == nil)
		return (false);
	
	SendBehind (w, nil);

	shellwindowmenudirty (); /*the checked item changes*/
		
	return (true);
	} /*windowsendtoback*/


boolean getlocalwindowrect (WindowPtr w, Rect *r) {
	
	if (w == nil) { /*defensive driving*/
		
		zerorect (r);
		
		return (false);
		}
		
		//Code change by Timothy Paustian Monday, May 1, 2000 9:19:35 PM
		//Changed to Opaque call for Carbon
		//we are assuming we want the entire window rectangle here, this may be wrong.
		//All defined in MacWindows.h
		//I had to do it this way to get the quick script window to work.
		//this may be moot because I am going to need to use a different WDEF
		//for the quick script window anyway.
		GetPortBounds(GetWindowPort(w), r);
	
	return (true);
	} /*getlocalwindowrect*/
	

boolean getglobalwindowrect (WindowPtr w, Rect *r) {
	
	if (!getlocalwindowrect (w, r))
		return (false);
	
	localtoglobalrect (w, r);
	
	return (true);
	} /*getglobalwindowrect*/


boolean findmousewindow (Point globalpt, WindowPtr *w, short *part) {
	
	#ifdef MACVERSION
		*part = FindWindow (globalpt, w);
	#endif

	return (*w != nil);
	} /*findmousewindow*/


boolean windowsetcolor (WindowPtr w, long color, boolean flforeground) {
	
	if (w == nil)
		return (false);
		
	pushwindowport(w);
		if (flforeground)
			ForeColor (color);
		else
			BackColor (color);
		
		popport ();

	return (true);
	} /*windowsetcolor**/


void showwindow (WindowPtr w) {
	
	#ifdef MACVERSION
		ShowWindow (w);
	#endif
	} /*showwindow*/


void hidewindow (WindowPtr w) {
	
	/*
	5.0a5 dmb: apparantly, we need to do more to fully activate the next
	window if w is in front now. Using SetWindowPos didn't work, so we 
	make two calls

	5.0a10 dmb: fixed above code. also, added SendBehind code for Mac here, 
	so it doesn't need to be done at the shell level

	5.1.5b15 dmb: still wasn't right. hiding the window leaves it in front.
	we need to activate the frontmost visible window.
	*/

	#ifdef MACVERSION
		HideWindow (w);
		
		if (w == getfrontwindow ()) /*don't allow hidden window to remain active*/
			SendBehind (w, getfrontwindow ());
	#endif

	} /*hidewindow*/

boolean windowvisible (WindowPtr w) {
	
	#ifdef MACVERSION
		//Code change by Timothy Paustian Monday, May 1, 2000 9:33:54 PM
		//Changed to Opaque call for Carbon
		return IsWindowVisible(w);
		//old code
		//return ((*(WindowPeek) w).visible);
	#endif
	} /*windowvisible*/


hdlregion getupdateregion (WindowPtr w) {
#ifdef MACVERSION
	//Code change by Timothy Paustian Monday, May 1, 2000 9:35:02 PM
	//Changed to Opaque call for Carbon
	//watch out here. Make sure we are not making a memory leak.
	//I wonder if the windows version leaks memory or if all these calls
	//are mapped out and disposed of in the windows version.
	//ask Andre
	#if ACCESSOR_CALLS_ARE_FUNCTIONS == 1
	hdlregion	rgn;
	//I think I found a bug in carbon. Calling get window region looking for
	//the update region is always returning 0,0,0,0. For now use the 
	//content region. I will ask about this on the carbon mailing list.
	rgn = NewRgn();
	GetWindowRegion(w, kWindowContentRgn, rgn);
	return (rgn);
	#else
	//old code
	hdlregion retRegion = (*(WindowPeek) w).updateRgn;
	return (retRegion);
	#endif
#endif

	} /*getupdateregion*/


hdlregion getvisregion (WindowPtr w) {
	hdlregion rgn = NewRgn();
	rgn = GetPortVisibleRegion(GetWindowPort(w), rgn);
	return (rgn);
	} /*getupdateregion*/


void setwindowrefcon (WindowPtr w, long refcon) {

	#ifdef MACVERSION
		//Code change by Timothy Paustian Monday, May 1, 2000 9:42:05 PM
		//Changed to Opaque call for Carbon
		SetWRefCon(w, refcon);
		//old code
		//(*(WindowPeek) w).refCon = refcon;
	#endif
	} /*setwindowrefcon*/


long getwindowrefcon (WindowPtr w) {

	#ifdef MACVERSION
		//Code change by Timothy Paustian Monday, May 1, 2000 9:42:44 PM
		//Changed to Opaque call for Carbon
		return GetWRefCon(w);
		/*old code
		return ((*(WindowPeek) w).refCon);*/
	#endif
	} /*getwindowrefcon*/



