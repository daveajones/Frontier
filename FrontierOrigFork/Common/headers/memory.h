
/*	$Id: memory.h 1186 2006-04-03 13:06:44Z hasseily $    */

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

#ifndef memoryinclude /*so other includes can tell if we've been loaded*/
#define memoryinclude /*so other includes can tell if we've been loaded*/


#ifndef shelltypesinclude

#include "shelltypes.h"

#endif


typedef struct handlestream {
	
	/*
	 5.0.2 dmb: new structure for stream-like operations on handle-based data
	 */
	
	Handle data;
	long pos;
	long eof;
	long size;
} handlestream, *ptrhandlestream;


#define isemptyhandle(h) (gethandlesize(h)==0)


extern boolean newhandle (long, Handle *);

extern boolean newemptyhandle (Handle *);

extern void disposehandle (Handle);

extern boolean newclearhandle (long, Handle *);

extern boolean newfilledhandle (ptrvoid, long, Handle *);

extern boolean copyhandle (Handle, Handle *);

extern boolean newtexthandle (const bigstring, Handle *);

extern boolean newheapstring (const bigstring, hdlstring *);

extern boolean concathandles (Handle, Handle, Handle *);

extern boolean mergehandles (Handle, Handle, Handle *);

extern boolean unmergehandles (Handle, Handle *, Handle *);

extern boolean newintarray (short, hdlintarray *);

extern boolean loadfromhandletohandle (Handle, long *, long, boolean, Handle *);

extern boolean loadhandleremains  (long, Handle, Handle *);



extern boolean analyzeheap (void);

extern void lockhandle (Handle);

extern void unlockhandle (Handle);

extern boolean validhandle (Handle);

extern long gethandlesize (Handle);

extern boolean sethandlesize (Handle, long);

extern boolean minhandlesize (Handle, long);

extern void moveleft (ptrvoid, ptrvoid, long);

extern void moveright (ptrvoid, ptrvoid, long);

extern void clearbytes (ptrvoid, long);

extern void clearhandle (Handle);

extern void movefromhandle (Handle, ptrvoid, long);

extern short comparehandles (Handle, Handle);

extern boolean equalhandles (Handle, Handle);

extern long searchhandle (Handle, Handle, long, long);

extern long searchhandleunicase (Handle, Handle, long, long);

extern boolean sethandlecontents (ptrvoid, long, Handle);

extern void texttostring (ptrvoid, long, bigstring);

extern void texthandletostring (Handle, bigstring);

extern boolean insertinhandle (Handle, long, ptrvoid, long);

extern boolean inserttextinhandle (Handle, long, bigstring);

extern boolean inserthandleinhandle (Handle hinsert, Handle h, unsigned long ix);

extern boolean pullfromhandle (Handle, long, long, ptrvoid);

extern boolean enlargehandle (Handle, long, ptrvoid);

extern boolean mungehandle (Handle, long, long, ptrvoid, long);

extern boolean pushtexthandle (const bigstring, Handle);

extern boolean pushindentedline (short, bigstring, Handle);

extern boolean setheapstring (const bigstring, hdlstring);

extern boolean pushhandle (Handle, Handle);

extern boolean pushcharhandle (char, Handle);	/*2006-03-10 aradke*/

extern boolean pushstringhandle (const bigstring, Handle);

//extern boolean concatheapstrings (hdlstring *, hdlstring *, hdlstring *);

extern boolean loadfromhandle (Handle, long *, long, ptrvoid);

extern boolean pushlongondiskhandle (long, Handle);

extern boolean loadlongfromdiskhandle (Handle, long *, long *);

extern boolean popfromhandle  (Handle, long, ptrvoid);

extern boolean copyhandlecontents (Handle, Handle);

extern boolean setintarray (hdlintarray, short, short);

extern boolean getintarray (hdlintarray, short, short *);

extern void fillintarray (hdlintarray, short);

extern void openhandlestream (Handle h, handlestream *s);

extern boolean growhandlestream (handlestream *s, long ct);

extern boolean writehandlestream (handlestream *s, void *p, long ct);

extern boolean writehandlestreamlong (handlestream *s, long x); /*6.2a8 AR*/

extern boolean writehandlestreamchar (handlestream *s, byte ch);

extern boolean writehandlestreamstring (handlestream *s, bigstring bs);

extern boolean writehandlestreamhandle (handlestream *s, Handle h);

extern boolean writehandlestreamhandlepart (handlestream *s, Handle h, long ix, long len); /*2003-04-27 AR*/

extern boolean writehandlestreamhandleindent (handlestream *s, Handle h, long i);

extern boolean writehandlestreamstringindent (handlestream *s, bigstring bs, long i);

extern boolean mergehandlestreamdata (handlestream *s, long ctreplace, ptrvoid pdata, long ctmerge);

extern boolean mergehandlestreamhandle (handlestream *s, long ctreplace, Handle hmerge);

extern boolean mergehandlestreamstring (handlestream *s, long ctreplace, bigstring bsmerge);

extern boolean readhandlestream (handlestream *, void *, long);

extern boolean pullfromhandlestream (handlestream *s, long ctpull, void *pdata);

extern long skiphandlestreamchars (handlestream *s, byte chskip);

extern boolean skiphandlestreamwhitespace (handlestream *);

extern long seekhandlestreamchar (handlestream *s, byte chseek);

extern boolean readhandlestreamfieldtohandle (handlestream *s, byte chdelimiter, Handle *hreturned);

extern boolean readhandlestreamfield (handlestream *s, byte chdelimiter, bigstring bsfield);

extern byte gethandlestreamcharacter (handlestream *s, long pos);

extern byte nexthandlestreamcharacter (handlestream *s);

extern byte lasthandlestreamcharacter (handlestream *s);

extern boolean athandlestreameof (handlestream *s);

extern Handle closehandlestream (handlestream *s);

extern void disposehandlestream (handlestream *s);

#endif



