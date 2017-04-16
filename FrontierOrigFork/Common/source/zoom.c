
/*	$Id: zoom.c 1208 2006-04-05 23:51:45Z karstenw $    */

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
#include "cursor.h"
#include "ops.h"
#include "dialogs.h"
#include "zoom.h"
#include "shell.h"
#include "shellprivate.h"



static long ctzoomdelayloops = 0;

static Rect rdefaultzoomfrom = {0, 0, 0, 0};

#define zoomfixer 65536L

static short zoomsteps = 14; /*decrease this number for faster zooming*/

static Point zoomratio = {5, 6}; /*must adjust to work with zoomsteps*/

Fixed zoomfract;




void zoomsetdefaultrect (WindowPtr w, Rect r) {
	
	rdefaultzoomfrom = r;
	
	localtoglobalrect (w, &rdefaultzoomfrom);
	} /*zoomsetdefaultrect*/



void zoomwindowfrom (Rect rsource, WindowPtr w) {

	/*
	animate the opening of a window.
	
	you tell us where you want the window to appear to be coming from.
	*/
	
	pushwindowport(w);
	ShowWindow (w);
	popport ();
	} /*zoomwindowfrom*/
	
	
void zoomwindowto (Rect rsource, WindowPtr w) {

	/*
	animate the closing of a window.
	
	you tell us where you want the window to appear to be going to.
	*/
	
	pushwindowport(w);
	HideWindow (w);	
	popport ();
	} /*zoomwindowto*/
	

void zoomcenterrect (Rect *rcenter) {
	
	Rect r;
	
	r = *rcenter;
	
	r.left += (r.right - r.left) / 2;
	
	r.right = r.left;
	
	r.top += (r.bottom - r.top) / 2;
	
	r.bottom = r.top;
	
	*rcenter = r;
	} /*zoomcenterrect*/
	

void zoomwindowtocenter (Rect r, WindowPtr w) {
	
	/*
	shrink the rectangle down to the point at its center and zoom the window
	down to that point.
	*/
	
	if (r.top > 0) /*don't smash it if it's the default rect*/
		zoomcenterrect (&r);
	
	zoomwindowto (r, w);
	} /*zoomwindowtocenter*/
	

void zoomwindowfromcenter (Rect r, WindowPtr w) {
	
	/*
	shrink the rectangle down to the point at its center and zoom the window
	up from that point.
	*/
	
	if (r.top > 0) /*don't smash it if it's the default rect*/
		zoomcenterrect (&r);
	
	zoomwindowfrom (r, w);
	} /*zoomwindowfromcenter*/
	

void zoomfromorigin (WindowPtr w) {
	
	Rect r;
	
	r.top = r.left = r.bottom = r.right = 0;
	
	zoomwindowfrom (r, w);
	} /*zoomfromorigin*/
	

void zoomtoorigin (WindowPtr w) {
	
	Rect r;
	
	r.top = r.left = r.bottom = r.right = 0;
	
	zoomwindowto (r, w);
	} /*zoomtoorigin*/
	
	

void zoominit (void) {
	
	counttickloops (&ctzoomdelayloops);
	
	ctzoomdelayloops /= 6; /*burn a sixth of a tick each iteration of the loop*/
	
	if (ctzoomdelayloops < 60) { /*we're on a slow machine*/
		
		ctzoomdelayloops = 0;
		
		zoomsteps = 7;
		
		zoomratio.h = 32;
		
		zoomratio.v = 21;
		}
	} /*zoominit*/
