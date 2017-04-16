
/*	$Id: ioacolorpopup.c 1197 2006-04-05 22:01:22Z karstenw $    */

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

/*original code by Dave Shaver, Quark, 303-849-3311, adapted by DW 2/9/93. Thanks Dave!*/

#include "frontier.h"
#include "standard.h"

#include <iac.h>
#include <ioa.h>
#include "ioacolorpopup.h"

#define colorpopuptype -3

#define mPopupMsg 3 /*this MDEF message isn't in the headers*/

#define outsetsize 1

#define itemsize 10

#define boxinset 5 /*the number of pixels to skip between box and text*/

#define textvertinset 2

#define gestalttrap 0xA1AD

#define unimplementedtrap 0xA09F


static boolean getgestaltattr (OSType selector, long *response) {
	
	return Gestalt(selector, response) == noErr;
	} /*getgestaltattr*/
	
	


static boolean colormenuclick (Point pt, RGBColor *rgb) {
	
	/*
	4.1b3 dmb: updated for ppc compatibility
	*/
	
	long result;
	MenuHandle colormenu;
	short lo, hi;
		
	IOAopenresfile ();
	
	colormenu = GetMenu (256);

	CalcMenuSize (colormenu);
		
	InsertMenu (colormenu, hierMenu);

	LocalToGlobal (&pt);
	
	result = PopUpMenuSelect (colormenu, pt.v, pt.h, 1);
	
	DisposeMenu (colormenu);
	
	IOAcloseresfile ();
	
	lo = LoWord (result);
	
	hi = HiWord (result);
	
	if (hi > 0) { /*something was selected*/
	
		CSpecArray *ctable;
		
		ctable = (CSpecArray *) &(**GetCTable (8)).ctTable;

		*rgb = (*ctable) [lo - 1].rgb;
		
		return (true);
		}
	
	return (false);
	} /*colormenuclick*/
	

static void getcolorrect (hdlobject h, Rect r, Rect *rbox) {
	
	hdlcard hc = (**h).owningcard;
	short objectfontsize = (**h).objectfontsize;
	FontInfo fi = (**hc).fontinfo;
	short lineheight;
	short extrapixels;
	
	lineheight = fi.ascent + fi.descent + fi.leading;
	
	extrapixels = (lineheight - objectfontsize) / 2;
	
	r.top += textvertinset;
	
	if (extrapixels > 0)
		r.top += (lineheight - objectfontsize) - extrapixels;
	
	r.bottom = r.top + objectfontsize;
	
	r.left += 3;
	
	r.right = r.left + objectfontsize;
	
	*rbox = r;
	} /*getcolorrect*/
	

static boolean getcoloreditrect (hdlobject h, Rect *r) {

	*r = (**h).objectrect;
		
	(*r).left += 3 + (**h).objectfontsize + boxinset;
	
	return (true); /*it can be edited*/
	} /*getcoloreditrect*/
	

static boolean clickcolorpopup (hdlobject listhead, hdlobject h, Point pt, boolean flshiftkey, boolean fl2click) {
#pragma unused(listhead, flshiftkey, fl2click)

	hdlcolordata hdata = (hdlcolordata) (**h).objectdata;
	RGBColor rgb;
	
	if (!colormenuclick (pt, &rgb))
		return (false);
		
	(**hdata).rgb = rgb;
		
	(**(**h).owningcard).runtimevaluechanged = true; /*DW 10/13/95*/
	
	IOAinvalobject (h);
	
	IOArunbuttonscript (h); /*1.0b15 -- run the action script*/
	
	return (true); /*do a minor recalc*/
	} /*clickcolorpopup*/
	
	
static boolean cleancolorpopup (hdlobject h, short height, short width, Rect *r) {

	hdlcard hc = (**h).owningcard;
	short gridunits = (**hc).gridunits;
	
	width = IOAmakemultiple (width + 3 + (**h).objectfontsize + boxinset, gridunits);
	
	(*r).right = (*r).left + width;
	
	(*r).bottom = (*r).top + height;
	
	return (true);
	} /*cleancolorpopup*/
	

static boolean canreplicatecolorpopup (hdlobject h) {
#pragma unused(h)
	return (true); 
	} /*canreplicatecolorpopup*/
	

#if 0

static boolean getcheckboxeditrect (hdlobject h, Rect *r) {

	*r = (**h).objectrect;
		
	(*r).left += 3 + (**h).objectfontsize + boxinset;
	
	return (true); /*it can be edited*/
	} /*getcheckboxeditrect*/

#endif
	

static void pushlong (long num, bigstring bs) {
	
	bigstring bsnum;
	
	NumToString (num, bsnum);
	
	IOApushstring (bsnum, bs);
	} /*pushlong*/
	
	
static boolean getcolorpopupvalue (hdlobject h, Handle *hvalue) {
	
	hdlcolordata hdata = (hdlcolordata) (**h).objectdata;
	RGBColor rgb = (**hdata).rgb;
	bigstring bs;
	
	IOAcopystring ("\p\"", bs);
	
	pushlong (rgb.red, bs);
	
	IOApushstring ("\p,", bs);
	
	pushlong (rgb.green, bs);
	
	IOApushstring ("\p,", bs);

	pushlong (rgb.blue, bs);
	
	IOApushstring ("\p\"", bs);
	
	return (IOAnewtexthandle (bs, hvalue));
	} /*getcolorpopupvalue*/
	
	
static void poplong (bigstring bs, unsigned short *x) {
	
	bigstring bsnum;
	long longval;
	
	bsnum [0] = 0;
	
	while (true) {
		
		short len;
		char ch;
		
		len = bs [0];
		
		if (len == 0)
			break;
			
		ch = bs [1];
		
		BlockMove (&bs [2], &bs [1], --len);
		
		bs [0] = len;
		
		if ((ch < '0') || (ch > '9')) 
			break;
			
		len = bsnum [0] + 1;
		
		bsnum [0] = len;
		
		bsnum [len] = ch;
		} /*while*/
	
	StringToNum (bsnum, &longval);
	
	*x = longval;
	} /*poplong*/
	

static boolean setcolorpopupvalue (hdlobject h, Handle hvalue) {

	hdlcolordata hdata = (hdlcolordata) (**h).objectdata;
	bigstring bs;
	RGBColor rgb;
	
	if (hvalue == nil)
		return (true);
		
	IOAtexthandletostring (hvalue, bs);
	
	DisposeHandle (hvalue);
	
	poplong (bs, &rgb.red);
	
	poplong (bs, &rgb.green);
	
	poplong (bs, &rgb.blue);
	
	(**hdata).rgb = rgb;
	
	return (true);
	} /*setcolorpopupvalue*/


static boolean debugcolorpopup (hdlobject h, bigstring errorstring) {
#pragma unused(h)
	setstringlength (errorstring, 0);
	
	return (true);
	} /*debugcolorpopup*/
	
	
static boolean drawcolorobject (hdlobject h) {
	
	hdlcard hc = (**h).owningcard;
	hdlcolordata hdata = (hdlcolordata) (**h).objectdata;
	RGBColor rgb = (**hdata).rgb;
	Rect rbox;
	Rect r;
	Handle htext;
	
	htext = (**h).objectvalue; 
	
	r = (**h).objectrect;
	
	if (!(**h).objecttransparent)
		EraseRect (&r);
		
	getcolorrect (h, r, &rbox);
	
	if (!(**h).objectenabled)
		rgb.red = rgb.green = rgb.blue = 61166; /*light gray*/
		
	IOApushbackcolor (&rgb);

	EraseRect (&rbox);
	
	IOApopbackcolor ();
		
	FrameRect (&rbox);
	
	if ((**hc).tracking && (**hc).trackerpressed) {
		
		Rect rinset = rbox;
		
		InsetRect (&rinset, 1, 1);
		
		FrameRect (&rinset);
		}
	
	if (!(**hc).flskiptext) {
		
		Rect rtext;
		
		getcoloreditrect (h, &rtext);
		
		IOAeditdrawtexthandle (htext, rtext, (**h).objectjustification);
		}
	
	return (true);
	} /*drawcolorobject*/
	
	
static boolean newcolordata (hdlcolordata *hdata) {

	hdlcolordata h;
	
	h = (hdlcolordata) NewHandleClear (longsizeof (tycolordata));
	
	if (h == nil)
		return (false);
	
	(**h).versionnumber = 1;
	
	(**h).rgb = lightbluecolor;
	
	*hdata = h;
	
	return (true);
	} /*newcolordata*/
	
	
static boolean initcolorpopup (tyobject *obj) {
	
	newcolordata ((hdlcolordata *) &(*obj).objectdata);
	
	return (true); /*nothing special, we do want to edit it*/
	} /*initcolorpopup*/
	
	
static boolean unpackcolordata (hdlobject h) {
	
	hdlcolordata hdata = (hdlcolordata) (**h).objectdata;
	
	if (hdata == nil) { /*pre 1.0b15 object, no data handle*/
		
		if (!newcolordata (&hdata))
			return (false);
			
		(**h).objectdata = (Handle) hdata;
		
		return (true);
		}
		
	return (true);
	} /*unpackcolordata*/


static boolean getcolorattributes (hdlobject h, AppleEvent *event) {
	
	hdlcolordata hdata = (hdlcolordata) (**h).objectdata;
	RGBColor rgb = (**hdata).rgb;
	
	IACglobals.event = event; 
	
	if (!IACpushRGBColorparam (&rgb, 'colr'))
		return (false);
	
	return (true);
	} /*getcolorattributes*/
	
	
static boolean setcolorattributes (hdlobject h, AppleEvent *event) {
	
	hdlcolordata hdata = (hdlcolordata) (**h).objectdata;	
	RGBColor rgb;
	
	IACglobals.event = event; 
	
	IACglobals.nextparamoptional = true;
	
	if (IACgetRGBColorparam ('colr', &rgb))
		(**hdata).rgb = rgb;
	
	return (true);
	} /*setcolorattributes*/
	
	
static boolean recalccolorpopup (hdlobject h, boolean flmajorrecalc) {
#pragma unused(flmajorrecalc)

	bigstring errorstring;
	Handle hrgbvalue;
	
	if (!IOAevalscript (h, (**h).objectrecalcscript, &hrgbvalue, (**h).objectlanguage, errorstring))
		return (false);
		
	setcolorpopupvalue (h, hrgbvalue); /*also disposes of hrgbvalue*/
	
	return (true); 
	} /*recalccolorpopup*/
	

void setupcolorpopup (tyioaconfigrecord *);


void setupcolorpopup (tyioaconfigrecord *config) {
	
	IOAcopystring ("\pColor popup", (*config).objectTypeName);
	
	(*config).objectTypeID = colorpopuptype;
	
	(*config).frameWhenEditing = true;
	
	(*config).canEditValue = true;
	
	(*config).toggleFlagWhenHit = false;
	
	(*config).mutuallyExclusive = false;
	
	(*config).speaksForGroup = false;
	
	(*config).handlesMouseTrack = true; /*allow the popup manager to track the mouse*/

	(*config).hasSpecialCard = false; /*dmb 1.0b22 - was true, but there's no card*/

	(*config).initObjectCallback = initcolorpopup;
	
	(*config).drawObjectCallback = drawcolorobject;
	
	(*config).clickObjectCallback = clickcolorpopup;
	
	(*config).cleanupObjectCallback = cleancolorpopup;
	
	(*config).canReplicateObjectCallback = canreplicatecolorpopup;
	
	(*config).getObjectEditRectCallback = getcoloreditrect;
	
	(*config).getValueForScriptCallback = getcolorpopupvalue;
	
	(*config).debugObjectCallback = debugcolorpopup;	
	
	(*config).getAttributesCallback = getcolorattributes;
	
	(*config).setAttributesCallback = setcolorattributes;
	
	(*config).unpackDataCallback = unpackcolordata;
	
	(*config).recalcObjectCallback = recalccolorpopup;
	} /*setupconfig*/
	
	
