
/*	$Id: sounds.c 1201 2006-04-05 22:31:38Z karstenw $    */

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
#include "error.h"
#include "strings.h"
#include "sounds.h"

#define squareWaveSynth 1
#define ampCmd 43
#define freqDurationCmd 40


boolean dosound (short duration, short amplitude, short frequency) {
	
	SndChannelPtr channel;
	SndCommand cmd;
	long ltime;
	float note;
	OSErr err;
	
	channel = nil;
	
	err = SndNewChannel (&channel, squareWaveSynth, 0, nil);
	
	if (oserror (err))
		return (false);
	
	cmd.cmd = ampCmd;
	cmd.param1 = amplitude;
	cmd.param2 = 0;
	err = SndDoCommand (channel, &cmd, false);
	
	ltime = duration * (2000/60);
	
	ltime = min (infinity, ltime);
	
	note = (frequency / 129.0) / 69;
	
	note = 69 + 12.0 * (note - 1);
	
	cmd.cmd = freqDurationCmd;
	cmd.param1 = ltime;
	cmd.param2 = note;
	err = SndDoCommand (channel, &cmd, false);
	
	err = SndDisposeChannel (channel, false);
	
	return (!oserror (err));
	} /*dosound*/

void motorsound (void) {
	
	dosound (1, 100, 100);
	} /*motorsound*/


void ouch (void) {
	
	sysbeep (); 

	} /*ouch*/


boolean playnamedsound (bigstring bsname) {

	Handle hsound;
	
	hsound = GetNamedResource ('snd ', bsname);
	
	if (hsound == nil)
		return (false);
	
	return (SndPlay (nil, (SndListHandle) hsound, false) == noErr);
	} /*playnamedsound*/



