
/*	$Id: fileloop.c 1831 2010-06-13 18:20:35Z andreradke $    */

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

#include "memory.h"
#include "strings.h"
#include "error.h"
#include "file.h"
#include "oplist.h"
#include "fileloop.h"


#ifdef MACVERSION

	typedef struct tyfilelooprecord {
		
		short vnum; /*the volume we're looping through*/
		
		long dirid; /*the folder we're looking in*/
		
		short ixdirectory; /*index for the next file to look at*/
		
		hdllistrecord hfilelist; /*a list of filenames to be looped over*/
		} tyfilelooprecord, *ptrfilelooprecord, **hdlfilelooprecord;

#endif // MACVERSION


#ifdef MACVERSION
	
	static boolean fileloopreleaseitem (Handle h) {
	#pragma unused(h)

		/*
		callback routine that disposes of one of our items.  since there are no
		handles linked into our handle, there's nothing to release.
		
		I just wanted to have one of these around so the next guy that uses the
		list facilty knows how to link a releaseitem callback routine.
		*/
		
		return (true);
		} /*fileloopreleaseitem*/
		

	boolean diskinitloop (tyfileloopcallback diskfilter, Handle *hdiskloop) {
	#pragma unused(diskfilter)

		/*
		same as fileinitloop, but for volumes on line
		
		8/15/92 dmb: added, but commented out, diskfilter support
		*/
		
		tyfilelooprecord info;
		ParamBlockRec pb;
		register hdlfilelooprecord h;
		short ix;
		hdllistrecord hlist;
		
		clearbytes (&pb, sizeof (pb)); /*init all fields to zero*/
		
		clearbytes (&info, sizeof (info));
		
		info.ixdirectory = 1; /*start with the first file*/
		
		if (!newfilledhandle (&info, sizeof (info), hdiskloop))
			return (false);
		
		h = (hdlfilelooprecord) *hdiskloop; /*copy into register*/
		
		hlist = nil;
		
		if (!opnewlist (&hlist, false)) 
			goto error;
		
		(**h).hfilelist = hlist;
		
		opsetreleaseitemcallback (hlist, &fileloopreleaseitem);
		
		ix = 1; /*start with file index 1*/
		
		while (true) {
			FSSpec fsvol;
			OSErr errcode;
			Handle hstring;
			#if TARGET_API_MAC_CARBON == 1
			HFSUniStr255	theName;
			//Code change by Timothy Paustian Thursday, June 29, 2000 10:29:59 AM
			//Updated to modern call for volume infomation
			//Ii am checking this now against the original.
			FSVolumeRefNum	vRefNum;//this is just a SInt16
			
			//Watch out that the fsvol.name parameter works as expected.
			//this is still not working the way it should
			errcode = FSGetVolumeInfo(0, ix, &vRefNum, kFSVolInfoNone, nil, &theName, nil);
			if (errcode == nsvErr) /*not an error, just ran out of volumes*/
				return (true);
			
			{
			UnicodeToTextInfo	theInfo;
			UnicodeMapping		theMapping;
			theMapping.unicodeEncoding = kTextEncodingUnicodeDefault;
			theMapping.otherEncoding = kTextEncodingMacRoman;
			theMapping.mappingVersion = kUnicodeUseLatestMapping;
			errcode = CreateUnicodeToTextInfo(&theMapping,&theInfo);
			if (oserror (errcode)) // 1/29/97 dmb: call oserror
				goto error;
			//fsvol.name[0] = theName.length;
			errcode = ConvertFromUnicodeToPString (theInfo, theName.length * 2, theName.unicode, fsvol.name);
			if (oserror (errcode)) // 1/29/97 dmb: call oserror
				goto error;
			}
			ix++;
			fsvol.vRefNum = vRefNum;
			
			#else //not carbon
			pb.volumeParam.ioVolIndex = ix++;
			
			pb.volumeParam.ioNamePtr = fsvol.name;
			
			errcode = PBGetVInfoSync (&pb);
			fsvol.vRefNum = pb.volumeParam.ioVRefNum;
			
			if (errcode == nsvErr) /*not an error, just ran out of volumes*/
				return (true);
			#endif//end carbon
			
			if (errcode == nsvErr) /*not an error, just ran out of volumes*/
				return (true);
			
			if (oserror (errcode)) // 1/29/97 dmb: call oserror
				goto error;
			
			fsvol.parID = fsRtParID;
			
			if (!newfilledhandle (&fsvol, sizeof (fsvol), &hstring))
				goto error;
			
			if (!oppushhandle (hlist, nil, (Handle) hstring))
				goto error;

			} /*while*/
		
		error:
		
		opdisposelist (hlist);
		
		disposehandle (*hdiskloop);
		
		*hdiskloop = nil;
		
		return (false);
		} /*diskinitloop*/

#endif // MACVERSION

boolean fileinitloop ( const ptrfilespec fst, tyfileloopcallback filefilter, Handle *hfileloop ) {

	#ifdef MACVERSION
	
		#pragma unused(filefilter)
		
		// FIXME: fileloops should really be rewritten using FSRefs instead of pre-carbon apis

		//
		// a conglomeration of filemanager incantations which sets up a UserLand
		// fileloop construct.  we create a new handle (allows fileloops to be
		// nested inside other file loops, not statically allocated) and fill it
		// with information that each iteration of a fileloop will need.  took
		// a minimum of two days fiddling (3/16-17/90) to get this to work -- DW.
		//
		// 2006-10-03 creedon: minimally FSRef-ized
		//
		// 3.0.2 dmb: make sure fs is a folder, not a file
		//
		// 2.1b2 dmb: updated to use filespecs
		//
		// 1992-08-15 dmb: added, but commented out, filefilter support
		//
		// 1991-12-06 dmb: generate dirNFErr when fileparsevolname fails
		//
		
		tyfilelooprecord info;
		CInfoPBRec pb;
		long dirid;
		register hdlfilelooprecord h;
		short ix;
		hdllistrecord hlist;
		FSSpec fs;
		
		if (oserror (macgetfsspec (fst, &fs) ) )
			return (false);
				
		clearbytes (&pb, sizeof (CInfoPBRec)); // init all fields to zero
		
		setoserrorparam ((ptrstring) fs.name);
		
		pb.hFileInfo.ioVRefNum = fs.vRefNum;
		
		pb.hFileInfo.ioDirID = fs.parID;
		
		pb.hFileInfo.ioNamePtr = (StringPtr) fs.name;
		
		if (oserror (PBGetCatInfoSync (&pb)))
			return (false);
		
		if (!foldertestcipbr (&pb)) { // 3.0.2
			
			oserror (dirNFErr);
			
			return (false);
			
			}
		
		dirid = pb.dirInfo.ioDrDirID; // must remember this for loop body
		
		clearbytes (&info, sizeof (info));
		
		info.vnum = pb.hFileInfo.ioVRefNum;
		
		info.dirid = pb.hFileInfo.ioDirID;
		
		info.ixdirectory = 1; // start with the first file
		
		if (!newfilledhandle (&info, sizeof (info), hfileloop))
			return (false);
		
		h = (hdlfilelooprecord) *hfileloop; // copy into register
		
		hlist = nil;
		
		if (!opnewlist (&hlist, false)) 
			goto error;
			
		(**h).hfilelist = hlist;
		
		opsetreleaseitemcallback (hlist, &fileloopreleaseitem);
		
		ix = 1; // start with file index 1
		
		while (true) {
			
			bigstring bsfile;
			Handle hstring;
			OSErr errcode;
			
			pb.dirInfo.ioDrDirID = dirid; // may be smashed by ioFlNum on previous loop
			
			pb.dirInfo.ioFDirIndex = ix++;
			
			pb.dirInfo.ioNamePtr = bsfile;
			
			errcode = PBGetCatInfoSync (&pb);
			
			if (errcode == fnfErr) // not an error, just ran out of files
				return (true);
				
			if (errcode == dirNFErr) // On OS X, this is what's returned for a read permission error. Weird.
				return (true);

			if (errcode == afpAccessDenied) // 2005-01-05 creedon - don't bail when user does not have the correct permissions < http://sourceforge.net/tracker/index.php?func=detail&aid=1096641&group_id=120666&atid=687798 >
				return (true);

			if (oserror (errcode)) // errcode != noErr
				goto error;
			
			if ( fs.parID == fsRtParID ) {
			
				if ( equalstrings ( bsfile, BIGSTRING ("\x0F" ".Spotlight-V100") ) ) // skip Spotlight
					continue;
					
				if ( equalstrings ( bsfile, BIGSTRING ("\x04" ".vol" ) ) ) // skip .vol ( volfs )
					continue;
				
				if ( equalstrings ( bsfile, BIGSTRING ("\x07" "Volumes") ) ) // skip Volumes
					continue;
				}
			
			if ( foldertestcipbr ( &pb ) )			
				if ( ! pushchar ( ':', bsfile ) ) // if it's a folder, insert a colon at the end of the file name
					goto error;
			
			//
			// if (filefilter != nil) {
			//	
			// 	if (!(*filefilter) (bspath, bsfile))
			// 		continue;
			// 	}
			//
			
			if (!newtexthandle (bsfile, &hstring))
				goto error;
			
			if (!oppushhandle (hlist, nil, (Handle) hstring))
				goto error;
				
			} // while
			
		error:
		
		opdisposelist (hlist);
		
		disposehandle (*hfileloop);
		
		*hfileloop = nil;
		
		return (false);
		
	#endif // MACVERSION
	
	} // fileinitloop


void fileendloop (Handle hfileloop) {

	#ifdef MACVERSION
	
		register hdlfilelooprecord h = (hdlfilelooprecord) hfileloop;
		
		opdisposelist ((**h).hfilelist);
		
		disposehandle ((Handle) h);
	
	#endif // MACVERSION
	} // fileendloop


boolean folderloop ( const ptrfilespec pfs, boolean flreverse, tyfileloopcallback filecallback, long refcon ) {

	#ifdef MACVERSION
	
		//
		// loop through all of the files in the folder at fs, and call filecallback 
		// for each one.
		// 
		// if flreverse is true, loop through files backwards to allow for deletions
		//
		// 2006-06-26 creedon: minimally FSRef-ized
		//
		// 1993-08-28 DW: inexplicably, getmacfileinfo is determining that ctfiles is 1
		// greater than the actual number of files in our folder (it's the History
		// folder in clayhistorymenu.c). the way the loop was structured, we visit
		// no files in the folder in this case. changed it so that on fnfErr we 
		// continue the loop. the next time thru it will find a file. hope this
		// doesn't break anything else (it shouldn't).
		//
		
		FSSpec fs;
		CInfoPBRec pb;
		long dirid;
		bigstring bsfile;
		short ix;
		long ctfiles;
		tyfileinfo info;
		OSErr ec;
		
		if (oserror (macgetfsspec (pfs, &fs) ) )
			return (false);
		
		setoserrorparam ((ptrstring) fs.name);
		
		if (!getmacfileinfocipbr (&fs, &pb))
			return (false);
			
		assert (BitTst (&pb.dirInfo.ioFlAttrib, 3)); // be sure it's a folder
		
		dirid = pb.dirInfo.ioDrDirID; // must remember this for loop body
		
		ctfiles = pb.dirInfo.ioDrNmFls;
		
		if (flreverse)
			ix = ctfiles;
		else
			ix = 1; // start with file index 1
		
		while (--ctfiles >= 0) {
			
			pb.dirInfo.ioDrDirID = dirid; // may be smashed by ioFlNum on previous loop
			
			pb.dirInfo.ioFDirIndex = ix;
			
			if (flreverse)
				--ix;
			else
				++ix;
			
			pb.dirInfo.ioNamePtr = bsfile;
			
			ec = PBGetCatInfoSync (&pb);
			
			if (ec == fnfErr) // DW 8/28/93: continue instead of returning true
				continue; 
				
			if (oserror (ec)) 
				return (false);
			
			filegetinfofrompbcipbr (&pb, &info);
			
			if (!(*filecallback) (bsfile, &info, refcon))
				return (false);
				
			} // while
			
		return (true);
		
	#endif // MACVERSION
	
	} // folderloop


boolean filenextloop ( Handle hfileloop, ptrfilespec fsfilet, boolean *flfolder ) {

	#ifdef MACVERSION
	
		//
		// 2006-06-26 creedon: minimally FSRef-ized
		//
		// 5.0.2b21 dmb: don't call FSMakeFSSpec for each file; just the first.
		//
		// 3.0.4b1 dmb: return true of fnfErr; script will have to handle error anyway
		//
		// 3.0.2b1 dmb: must set flfolder to true for disks
		//
		// 2.1b11 dmb: for volumes, whole fsspec is now stashed in handle
		//
		// 2.1b2 dmb: now we're using filespecs!
		//
		// 1992-08-17 dmb: we're using text handles now instead of string handles.
		
		register hdlfilelooprecord h = (hdlfilelooprecord) hfileloop;
		Handle hdata;
		bigstring bs;
		short vnum;
		long dirid;
		OSErr err;
		FSSpec fsfile;
		FSRef fsref;
		
		if (!opgetlisthandle ((**h).hfilelist, (**h).ixdirectory++, nil, &hdata))
			return (false);
		
		vnum = (**h).vnum;
		
		if (vnum == 0) { /*item is a volume, hdata contains refnum*/
			
			/*
			vnum = **(short **) hdata;
			
			setemptystring (bs);
			*/
			
			fsfile = **(FSSpec **) hdata;
			
			*flfolder = true; /*3.0.2b1*/
			
			FSpMakeFSRef ( &fsfile, &fsref );
			
			macmakefilespec ( &fsref, fsfilet );
				
			return (true);
			
			}
		else {
			
			dirid = (**h).dirid;
			
			texthandletostring (hdata, bs);
			
			*flfolder = (lastchar (bs) == ':');
			
			if (*flfolder)
				--*bs;
			
			if ((**h).ixdirectory == 2) { //first time
				
				err = FSMakeFSSpec (vnum, dirid, bs, &fsfile);
				
				(**h).vnum = fsfile.vRefNum;
				
				(**h).dirid = fsfile.parID;
				
				if ((err == noErr) || (err == fnfErr)) { // 3.0.4b1 dmb
				
					err = FSpMakeFSRef ( &fsfile, &fsref );
					
					macmakefilespec ( &fsref, fsfilet );
					
					if ( *flfolder )
						( void ) fileisfolder ( fsfilet, flfolder );
					
					return ( true );
					
					}
				
				return ( ! oserror ( err ) ); // false
				
				}
			else {
				
				fsfile.vRefNum = vnum;
				
				fsfile.parID = dirid;
				
				copystring (bs, fsfile.name);
				
				FSpMakeFSRef ( &fsfile, &fsref );
				
				macmakefilespec ( &fsref, fsfilet );
				
				if ( *flfolder )
					( void ) fileisfolder ( fsfilet, flfolder );
				
				return ( true );
				
				}
			}
		
	#endif // MACVERSION
	
	} // filenextloop

