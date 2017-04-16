
/*	$Id: threads.c 1208 2006-04-05 23:51:45Z karstenw $    */

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

#ifdef MACVERSION
#include "mac.h"
#include "processinternal.h"
#endif

#include "error.h"
#include "ops.h"
#include "memory.h"
#include "threads.h"
#include "shell.h"

//#define flprofile

#ifdef flprofile
static long ctcreated = 0;
static long cttickstostart = 0;
static long latency;
#endif

tythreadcallbacks threadcallbacks;


static ThreadID idwaitingthread = kNoThreadID;
static ThreadID idmainthread;


static pascal void copythreadcontext (ThreadID hthread, void * hglobals) {
#pragma unused (hthread)

	(*threadcallbacks.swapoutcallback) (hglobals);
	
	} /*copythreadcontext*/


static pascal void swapinthreadcontext (ThreadID hthread, void * hglobals) {
#pragma unused (hthread)

	(*threadcallbacks.swapincallback) (hglobals);
	
	} /*swapinthreadcontext*/


static pascal void disposethreadcontext (ThreadID hthread, void * hglobals) {
#pragma unused (hthread)

	//Code change by Timothy Paustian Thursday, May 11, 2000 4:44:59 PM
	//Get rid of the UPPs for carbon here
	#if TARGET_API_MAC_CARBON == 1
	hdlthreadglobals	globals = (hdlthreadglobals)hglobals;
	HLock((Handle) globals);
	DisposeThreadSwitchUPP((**globals).threadInCallbackUPP);
	DisposeThreadSwitchUPP((**globals).threadOutCallbackUPP);
	DisposeThreadTerminationUPP((**globals).threadTerminateUPP);
	DisposeThreadEntryUPP((**globals).threadEntryCallbackUPP);
	HUnlock((Handle) globals);
	#endif
		
	(*threadcallbacks.disposecallback) (hglobals);
	} /*disposethreadcontext*/


static void setthreadprocs (ThreadID idthread, void * hglobals) {
	
	/*
	before a thread is set loose, establish our custom swapping routines
	*/
	//Code change by Timothy Paustian Thursday, May 11, 2000 4:38:48 PM
	//creating the UPPs for use on carbon.
	#if TARGET_API_MAC_CARBON == 1
	hdlthreadglobals	globals = (hdlthreadglobals)hglobals;
	HLock((Handle) globals);
	(**globals).threadInCallbackUPP = NewThreadSwitchUPP(&swapinthreadcontext);
	(**globals).threadOutCallbackUPP = NewThreadSwitchUPP(&copythreadcontext);
	(**globals).threadTerminateUPP = NewThreadTerminationUPP(&disposethreadcontext);
	
	SetThreadSwitcher (idthread, (**globals).threadInCallbackUPP, hglobals, true);
	
	SetThreadSwitcher (idthread, (**globals).threadOutCallbackUPP, hglobals, false);
	
	SetThreadTerminator (idthread, (**globals).threadTerminateUPP, hglobals);
	
	HUnlock((Handle) globals);
	#else
		
	SetThreadSwitcher (idthread, &swapinthreadcontext, hglobals, true);
	
	SetThreadSwitcher (idthread, &copythreadcontext, hglobals, false);
	
	SetThreadTerminator (idthread, &disposethreadcontext, hglobals);
	#endif
		} /*setthreadprocs*/

boolean initmainthread (void * hglobals) {


	setthreadprocs (kApplicationThreadID, hglobals);
	
	GetCurrentThread (&idmainthread);
	
	return (true);
	} /*initmainthread*/


boolean inmainthread (void) {
	
	ThreadID idthread;

	GetCurrentThread (&idthread);
	
	return (idthread == idmainthread);
	} /*inmainthread*/


boolean attachtomainthread (long idthread) {
#ifdef MACVERSION
#	pragma unused (idthread)
#endif

	return (true); /*it's a no-op*/
	}/*attachtomainthread*/


static const Size minStackSize = 512;

boolean newthread (tythreadmaincallback threadmain, tythreadmainparams threadparams, void *hglobals, hdlthread *hthread) {

	OSErr err;
	ThreadID idthread;
	//Code change by Timothy Paustian Thursday, May 11, 2000 4:49:58 PM
	//we need to create a thread callback UPP for carbon. 

	hdlthreadglobals	globals = (hdlthreadglobals)hglobals;
	(**globals).threadEntryCallbackUPP = NewThreadEntryUPP((ThreadEntryProcPtr)threadmain);
	err = NewThread (kCooperativeThread, (**globals).threadEntryCallbackUPP, threadparams, minStackSize, kUsePremadeThread + kCreateIfNeeded + kFPUNotNeeded, nil, &idthread);
		
	if (oserror (err))
		return (false);
	
	setthreadprocs (idthread, hglobals);
	
	idwaitingthread = idthread; /*make sure we get scheduled*/
	
	*hthread = (hdlthread) idthread;
	
	return (true);
	} /*newthread*/


boolean threadiswaiting (void) {

	/*
	5.1.5 dmb: support this verb on windows
	*/

#ifdef MACVERSION
	return (idwaitingthread != kNoThreadID);
#endif
	} /*threadiswaiting*/


boolean threadyield (boolean flresting) {
#pragma unused(flresting)

	/*
	5.0a19 dmb: added flresting parameter
	*/

	ThreadID idthread = idwaitingthread;
	
	idwaitingthread = kNoThreadID;
	
	return (YieldToThread (idthread) == noErr);
	} /*threadyield*/


boolean threadstartup (void) {
	
	/*
	called by thread mains to let us know that hnow thead is waiting anymore

	under windows, we must grab a critical section before we can proceed.

	5.0a10 dmb: return true for windows! (was random)
	*/

	idwaitingthread = kNoThreadID; /*not waiting any more*/
	
	return (true);
	} /*threadstartup*/


void threadshutdown (void) {
	
	} /*threadshutdown*/


boolean threadsleep (hdlthread hthread) {

	ThreadID idthread = kCurrentThreadID;
	OSErr err;
	
	if (hthread != nil)
		idthread = (ThreadID) hthread;
	
	err = SetThreadState (idthread, kStoppedThreadState, kNoThreadID);

	if (err != noErr)
		return (false);
	
	if (idthread == idwaitingthread) //set by wakeup?
		idwaitingthread = 0;
	
	return (true);
	} /*threadsleep*/


boolean threadissleeping (hdlthread hthread) {
	
	ThreadState state;
	
	if (hthread == nil)
		return (false);
	
	if (GetThreadState ((ThreadID) hthread, &state) != noErr)
		return (false);
	
	return (state == kStoppedThreadState);
	} /*threadissleeping*/


boolean threadwake (hdlthread hthread, boolean flpriority) {
	
	OSErr err;
	
	if (!threadissleeping (hthread))
		return (false);
	
	err = SetThreadState ((ThreadID) hthread, kReadyThreadState, kNoThreadID);
	
	if (err != noErr)
		return (false);
	
	if (flpriority && !idwaitingthread)
		idwaitingthread = (ThreadID) hthread;
	
	return (true);
	} /*threadwake*/


boolean initthreads (void) {
	
	long attrs;
	
	if (!gestalt (gestaltThreadMgrAttr, &attrs))
		return (false);
	
	if ((attrs & (1 << gestaltThreadMgrPresent)) == 0)
		return (false);
	
	return (true);
	} /*inittheads*/


