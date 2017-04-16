
/*	$Id: iacsysevents.c 1198 2006-04-05 22:03:52Z karstenw $    */

/*© copyright 1991-96 UserLand Software, Inc. All Rights Reserved.*/


#include "frontier.h"
#include "standard.h"

#include "iacinternal.h"

/*
7/16/94 dmb: Updated for Univeral Headers, PowerPC
*/



typedef struct tysystemhandler {
	
	AEEventClass eventclass;
	
	AEEventID id;
	
	tyAEHandler proc;
	
	long A5;
	
	struct tysystemhandler **hnexthandler;
	} tysystemhandler, **hdlsystemhandler;
	

hdlsystemhandler hfirstsystemhandler = nil;




static pascal OSErr callhandler (const AppleEvent *event, AppleEvent *reply, long refcon) {

	hdlsystemhandler h = (hdlsystemhandler) refcon;
	OSErr ec = (*(**h).proc) (event, reply, 0L);
	return (ec);
	} /*callhandler*/

#if TARGET_API_MAC_CARBON == 1
#define callhandlerUPP ((AEEventHandlerUPP) callhandler)
#else		
#if GENERATINGCFM

	static RoutineDescriptor callhandlerDesc = BUILD_ROUTINE_DESCRIPTOR (uppAEEventHandlerProcInfo, callhandler);

	#define callhandlerUPP (&callhandlerDesc)

#else
	
	#define callhandlerUPP ((AEEventHandlerUPP) callhandler)

#endif
#endif

Boolean IACinstallsystemhandler (AEEventClass eventclass, AEEventID id, ProcPtr handler) {
	
	OSErr ec;
	hdlsystemhandler h;
	
	h = (hdlsystemhandler) NewHandle ((long) sizeof (tysystemhandler));
	
	if (h == nil)
		return (false);
		
	(**h).eventclass = eventclass;
	
	(**h).id = id;
	
	(**h).proc = (tyAEHandler) handler;
	
	ec = AEInstallEventHandler (eventclass, id, callhandlerUPP, (long) h, true);
	
	IACglobals.errorcode = ec;

	if (ec != noErr) {
		
		DisposeHandle ((Handle) h);
		
		return (false);
		}
		
	(**h).hnexthandler = hfirstsystemhandler;
	
	hfirstsystemhandler = h;
	
	return (true);
	} /*IACinstallsystemhandler*/
	
	
Boolean IACremovesystemhandler (AEEventClass eventclass, AEEventID id, ProcPtr handler) {
#pragma unused(handler)

	hdlsystemhandler h = hfirstsystemhandler;
	hdlsystemhandler hprev = nil;
	OSErr ec;
	
	while (h != nil) {
		
		if (((**h).eventclass == eventclass) && ((**h).id == id)) {
			
			ec = AERemoveEventHandler (eventclass, id, callhandlerUPP, true);
			
			if (hprev == nil)
				hfirstsystemhandler = (**h).hnexthandler;
			else
				(**hprev).hnexthandler = (**h).hnexthandler;
				
			DisposeHandle ((Handle) h);
			
			return (true);
			}
		
		hprev = h;
		
		h = (**h).hnexthandler;
		} /*while*/
		
	return (false);
	} /*IACremovesystemhandler*/
	
	
void IACremovesystemhandlers (void) {
	
	/*
	remove all system event handlers that were installed by this application.
	
	3/4/93 DW: make it possible for this routine to be called two or more times.
	*/
	
	hdlsystemhandler h = hfirstsystemhandler;
	hdlsystemhandler hnext;
	OSErr ec;
	
	while (h != nil) {
		
		ec = AERemoveEventHandler ((**h).eventclass, (**h).id, callhandlerUPP, true);
		
		IACglobals.errorcode = ec;
		
		hnext = (**h).hnexthandler;
		
		DisposeHandle ((Handle) h);
		
		h = hnext;
		} /*while*/
		
	hfirstsystemhandler = nil; /*3/4/93*/
	} /*IACremovesystemhandlers*/
	
	
