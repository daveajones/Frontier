
/*	$Id: iacnetwork.c 1198 2006-04-05 22:03:52Z karstenw $    */

/*© copyright 1991-96 UserLand Software, Inc. All Rights Reserved.*/


#include "frontier.h"
#include "standard.h"

#include <appletdefs.h>
#include "iac.h"

#define typeTargetID 'targ'



static pascal Boolean string2networkaddress (ConstStr255Param bsadr, TargetID *target) {
#pragma unused(bsadr, target)

	/*
	2004-10-21 aradke: Can't do this on Carbon, give up and return bogus error
	*/

	IACglobals.errorcode = noResponseErr;

	return (false);

	} /*string2networkaddress*/


Boolean IACnewnetworkverb (ConstStr255Param bsadr, OSType vclass, OSType vtoken, AppleEvent *event) {
	
	TargetID target;
	AEAddressDesc adr; 
	OSErr ec;
	
	if (!string2networkaddress (bsadr, &target))
		return (false);
	
	ec = AECreateDesc (typeTargetID, (Ptr) &target, sizeof (target), &adr);
	
	if (ec != noErr)
		goto exit;
	
	ec = AECreateAppleEvent (vclass, vtoken, &adr, kAutoGenerateReturnID, kAnyTransactionID, event);
	
	/*AEDisposeDesc (&adr);*/
	
	exit:
	
	IACglobals.errorcode = ec;
	
	return (ec == noErr);
	} /*IACnewnetworkverb*/

