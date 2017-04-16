
/*	$Id: timedate.c 1211 2006-04-06 00:20:14Z karstenw $    */

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
#include "error.h"
#include "memory.h"
#include "strings.h"
#include "ops.h"
#include "langinternal.h"
#include "shell.h"
#include "timedate.h"

#define tydate DateTimeRec

typedef struct tyValidationOrder {
	short item;
	short type;
} tyValidationOrder, * tyValidationOrderPtr;

typedef unsigned long tyCharacterAttributes;


static short daysInMonthsArray[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

#define DateTimeSet_kDayOfWeek		0x0100
#define DateTimeSet_kYear			0x0040
#define DateTimeSet_kMonth			0x0020
#define DateTimeSet_kDay			0x0010
#define DateTimeSet_kHour			0x0008
#define DateTimeSet_kMinute			0x0004
#define DateTimeSet_kSecond			0x0002
#define DateTimeSet_kHundredth		0x0001

#define DurationUnit_kDays			0x0010

#define err_kTooManyNumberFields	20000
#define err_kTooFewValues			20001
#define err_kOutOfOrder				20002
#define err_kItemUsed				20003
#define err_kInvalidPunctuation		20004
#define err_kHundredthValueInvalid  20005
#define err_kSecondValueInvalid		20006
#define err_kMinuteValueInvalid		20007
#define err_kHourValueInvalid		20008
#define err_kAMorPMon24HourClock	20009

#define CharAttr_kShortDate			0x00000001
#define CharAttr_kLongDate			0x00000002
#define CharAttr_kTime				0x00000004

#define SCAN_DOW	1
#define SCAN_MONTH	2
#define SCAN_YEAR	4

#define VALTYPE_NONE		0
#define VALTYPE_KEYMONTHNAME1	1
#define VALTYPE_KEYMONTHNAME2	2
#define VALTYPE_KEYDAYNAME1	3
#define VALTYPE_KEYDAYNAME2	4
#define VALTYPE_KEYYEARNAME	5
#define VALTYPE_KEYTIMEAM	6
#define VALTYPE_KEYTIMEPM	7
#define VALTYPE_KEYTIME24	8
#define VALTYPE_CURRENCY	9
#define VALTYPE_BLANK	       10
#define VALTYPE_NUMERIC        11
#define VALTYPE_PUNC	       12
#define VALTYPE_NONNUMERIC     13

#define VALORDER_NUMERIC	1
#define VALORDER_FIXEDNUMERIC	2
#define VALORDER_KEYWORD	3

#define VALFLAG_ISDOLLARS	(0x1000)
#define VALFLAG_ISCENTS 	(0x2000)

typedef struct tyvalidationtoken
   {
   short ty;
   char * pos;
   short count;
   long val;
   unsigned long flag;
   } tyvalidationtoken, * tyvalidationtokenptr;


typedef struct tydaterec {
	short year;
	short month;
	short dayOfWeek;
	short day;
	short hour;
	short minute;
	short second;
	short hundredths;
	} tydaterec, * tydaterecptr;

typedef struct tyvalidationerror {
	long errorNumber;
	long stringPosition;
	char * auxilaryPointer;
	} tyvalidationerror, * tyvalidationerrorptr;




boolean isLeapYear (short year) {
	/* this procedure assumes the existance of the Gregorian calendar only */
	/* This basically means it's not valid for years before the adoption of
	   the Gregorian calendar.  This adoption varies by country, starting in
	   Europe as early as the 1400's and as late as the 1900's in Russia. */

	boolean res;

	res = false;

	if ((year % 4) == 0) {
		res = true;

		if ((year % 100) == 0) {
			res = false;

			if ((year % 400) == 0) {
				res = true;
				}
			}
		}

	return (res);
	} /*isLeapYear*/


short daysInMonth (short month, short year) {
	short res;

	/*this procedure assumes month valid from 1 to 12*/

	res = daysInMonthsArray [month-1];

	if (month == 2) {
		if (isLeapYear (year))
			++res;
		}

	return (res);
	} /* daysInMonth */



void timestamp (long *ptime) {
	
	GetDateTime ((unsigned long *) ptime);
	} /*timestamp*/
	
	
unsigned long timenow (void) {
	
	/*
	2.1b4 dmb; more convenient than timestamp for most callers
	*/
	
	unsigned long now;
	
	GetDateTime (&now);
	
	return (now);
	} /*timenow*/
	
	
boolean setsystemclock (unsigned long secs) {

	/*
	3/10/97 dmb: set the system clock, using Macintosh time 
	conventions (seconds since 12:00 PM Jan 1, 1904)
	*/

	return (!oserror (SetDateTime (secs)));
	} /*setsystemclock*/


static void
adjustforcurrenttimezone (unsigned long *ptime)
{
	/*
	5.1b23 dmb: avoid wraparound for near-zero dates
	*/

	unsigned long adjustedtime = *ptime + getcurrenttimezonebias ();

	if (sgn (*ptime) == sgn (adjustedtime))
		*ptime = adjustedtime;
	} /*adjustforcurrenttimezone*/


boolean
timegreaterthan (
		unsigned long time1,
		unsigned long time2)
{
	return (time1 > time2);
	} /*timegreaterthan*/


boolean
timelessthan (
		unsigned long time1,
		unsigned long time2)
{
	return (time1 < time2);
} /*timelessthan*/


boolean timetotimestring (unsigned long ptime, bigstring bstime, boolean flwantseconds) {

	//Code change by Timothy Paustian Sunday, June 25, 2000 9:45:30 PM
	//updated call for carbon, the nil parameter says use the current script
	//for formatting the time.
	TimeString (ptime, flwantseconds, bstime, nil);

	return (true);
	} /*timetotimestring*/


boolean timetodatestring (unsigned long ptime, bigstring bsdate, boolean flabbreviate) {

	//Code change by Timothy Paustian Sunday, June 25, 2000 9:45:49 PM
	//Updated call for carbon
	DateString (ptime, flabbreviate? abbrevDate : shortDate, bsdate, nil);

	return (true);
	} /*timetodatestring*/


boolean stringtotime (bigstring bsdate, unsigned long *ptime) {
	
	/*
	9/13/91 dmb: use the script manager to translate a string to a 
	time in seconds since 12:00 AM 1904.
	
	if a date is provided, but no time, the time is 12:00 AM
	
	if a time is provided, but no date, the date is 1/1/1904.
	
	we return true if any time/date information was extracted.
	*/
	
		Ptr p = (Ptr) bsdate + 1;
		long n = stringlength (bsdate);
		long used = 0;
		DateCacheRecord cache;
		LongDateRec longdate;
		boolean flgotdate;
		boolean flgottime;
		DateTimeRec shortdate;
		boolean flUseGMT = false;
		long idx;
		
		idx = stringlength (bsdate);

		while (getstringcharacter(bsdate, idx-1) == ' ')
			--idx;

		if (idx > 3) {
			if ((getstringcharacter(bsdate, idx - 3) == 'G') && (getstringcharacter(bsdate, idx - 2) == 'M') && (getstringcharacter(bsdate, idx -1) == 'T')) {
				flUseGMT = true;
				}
			}

		*ptime = 0; /*default return value*/
		
		clearbytes (&longdate, sizeof (longdate));
		
		if (InitDateCache (&cache) != noErr) /*must do this before calling StringToDate*/
			return (false);
		
		flgotdate = ((StringToDate (p, n, &cache, &used, &longdate) & fatalDateTime) == 0);
		
		flgottime = ((StringToTime (p + used, n - used, &cache, &used, &longdate) & fatalDateTime) == 0);
		
		if (!flgotdate && !flgottime) /*nuthin' doin'*/
			return (false);
		
		if (flgotdate) {
		
			shortdate.day = longdate.ld.day;
			
			shortdate.month = longdate.ld.month;
			
			shortdate.year = longdate.ld.year;
			}
		else {
			
			SecondsToDate (0, &shortdate);
			
			/*
			GetTime (&shortdate);
			*/
			}
		
		shortdate.hour = longdate.ld.hour; /*time fields will be zero if !flgottime*/
		
		shortdate.minute = longdate.ld.minute;
		
		shortdate.second = longdate.ld.second;
		
		DateToSeconds (&shortdate, ptime);

		if (flUseGMT) {
			adjustforcurrenttimezone (ptime);
			}
		
	return (true);
	} /*stringtotime*/


long datetimetoseconds (short day, short month, short year, short hour, short minute, short second) {
	
	/*
	5.0a12 dmb: Win version, must handle hour, minute, second wraparound
	*/

		DateTimeRec date;
		unsigned long secs;
		
		if (year < 100) { /*use script manager's StringToDate heuristic -- pg 188 in § docs*/
			
			long thisyear, lcentury;
			
			GetTime (&date);
			
			thisyear = date.year % 100;
			
			lcentury = date.year - thisyear;
			
			if ((thisyear <= 10) && (year >= 90)) /*assume last century*/
				lcentury -= 100;
			else
				if ((thisyear >= 90) && (year <= 10)) /*assume next century*/
					lcentury += 100;
			
			year += lcentury;
			}
		
		clearbytes (&date, sizeof (date));
		
		date.day = day;
		
		date.month = month;
		
		date.year = year;
		
		date.hour = hour;
		
		date.minute = minute;
		
		date.second = second;
		
		DateToSeconds (&date, &secs);

	return (secs);
	} /*datetimetoseconds*/


void secondstodatetime (long secs, short *day, short *month, short *year, short *hour, short *minute, short *second) {
	
		DateTimeRec date;
		
		SecondsToDate (secs, &date);
		
		*day = date.day;
		
		*month = date.month;
		
		*year = date.year;
		
		*hour = date.hour;
		
		*minute = date.minute;
		
		*second = date.second;
	} /*secondstodatetime*/


void secondstodayofweek (long secs, short *dayofweek) {
	
	#ifdef MACVERSION

		DateTimeRec date;
		
		SecondsToDate (secs, &date);
		
		*dayofweek = date.dayOfWeek;
	#endif

	} /*secondstodayofweek*/


static void fixdate (tydate * date) {

	date->minute = date->minute + (date->second / 60);
		date->second = date->second % 60;
		date->hour = date->hour + (date->minute / 60);
		date->minute = date->minute % 60;
		date->day = date->day + (date->hour / 24);
		date->hour = date->hour % 24;

		/* we pre-adjust the month to ensure that it is in a valid range */
		date->year = date->year + ((date->month - 1) / 12);
		date->month = ((date->month - 1) % 12) + 1;

		while (date->day > daysInMonth(date->month, date->year)) {
			date->day = date->day - daysInMonth(date->month, date->year);

			if (date->month < 12) {
				++(date->month);
				}
			else {
				date->month = 1;
				++(date->year);
				}
			}
	} /*fixdate*/


unsigned long nextmonth(unsigned long date) {

	/*
	6.0a10 dmb: limit day to max days for new month
	*/
	
		DateTimeRec daterec;
		short maxday;
		
		SecondsToDate (date, &daterec);
		
		if (daterec.month < 12) {
			++daterec.month;
			}
		else {
			daterec.month = 1;
			++daterec.year;
			}
		
		maxday = daysInMonth(daterec.month, daterec.year);
		
		if (daterec.day > maxday)
			daterec.day = maxday;
		
		fixdate (&daterec);

		DateToSeconds (&daterec, &date);

		return (date);
	} /*nextmonth*/

unsigned long nextyear(unsigned long date) {
	#ifdef MACVERSION

		DateTimeRec daterec;
		
		SecondsToDate (date, &daterec);
		
		++daterec.year;

		fixdate (&daterec);

		DateToSeconds (&daterec, &date);

		return (date);
	#endif

	} /*nextyear*/

unsigned long prevmonth(unsigned long date) {

	/*
	6.0a10 dmb: limit day to max days for new month
	*/
	
	#ifdef MACVERSION

		DateTimeRec daterec;
		short maxday;
		
		SecondsToDate (date, &daterec);
		
		if (daterec.month > 1) {
			--daterec.month;
			}
		else {
			daterec.month = 12;
			--daterec.year;
			}

		maxday = daysInMonth(daterec.month, daterec.year);
		
		if (daterec.day > maxday)
			daterec.day = maxday;
		
		fixdate (&daterec);

		DateToSeconds (&daterec, &date);

		return (date);
	#endif

	} /*prevmonth*/

unsigned long prevyear(unsigned long date) {
		DateTimeRec daterec;
		
		SecondsToDate (date, &daterec);
		
		--daterec.year;

		fixdate (&daterec);

		DateToSeconds (&daterec, &date);

		return (date);
	} /*prevyear*/

unsigned long firstofmonth(unsigned long date) {

		DateTimeRec daterec;
		
		SecondsToDate (date, &daterec);
		
		daterec.day  = 1;

		daterec.hour = 0;
		daterec.minute = 0;
		daterec.second = 0;

		DateToSeconds (&daterec, &date);

		return (date);
	} /*firstofmonth*/

unsigned long lastofmonth(unsigned long date) {
		DateTimeRec daterec;
		
		SecondsToDate (date, &daterec);
		
		daterec.day  = daysInMonth(daterec.month, daterec.year);

		daterec.hour = 0;
		daterec.minute = 0;
		daterec.second = 0;

		DateToSeconds (&daterec, &date);

		return (date);
	} /*lastofmonth*/


void shortdatestring (unsigned long date, bigstring bs) {
		//Code change by Timothy Paustian Sunday, June 25, 2000 9:48:03 PM
		//Updated for carbon
		DateString (date, shortDate, bs, nil);
	} /*shortdatestring*/

void longdatestring (unsigned long date, bigstring bs) {
		//Code change by Timothy Paustian Sunday, June 25, 2000 9:48:20 PM
		//Updated for Carbon
		DateString (date, longDate, bs, nil);
	} /*longdatestring*/

void abbrevdatestring (unsigned long date, bigstring bs) {
		//Code change by Timothy Paustian Sunday, June 25, 2000 9:48:36 PM
		//updated for carbon
		DateString (date, abbrevDate, bs, nil);
	} /*abbrevdatestring*/

void getdaystring (short dayofweek, bigstring bs, boolean flFullname) {

	switch (dayofweek) {
			case 1:
				copyctopstring ("Sunday", bs);
				break;

			case 2:
				copyctopstring ("Monday", bs);
				break;

			case 3:
				copyctopstring ("Tuesday", bs);
				break;

			case 4:
				copyctopstring ("Wednesday", bs);
				break;

			case 5:
				copyctopstring ("Thursday", bs);
				break;

			case 6:
				copyctopstring ("Friday", bs);
				break;

			case 7:
				copyctopstring ("Saturday", bs);
				break;

			default:
				copyctopstring ("Day of week number is invalid (not between 1 and 7)", bs);
				break;
			}

		if (! flFullname)
			setstringlength (bs, 3);
	} /*getdaystring*/

long getcurrenttimezonebias(void) {

	MachineLocation ml;
		long res;

		ReadLocation (&ml);
		
		res = ml.u.gmtDelta & 0x00FFFFFF;

		if ((res & 0x00800000) == 0x00800000)  //if this is a negative number extend the sign bits
			res = res | 0xFF000000;

		return (res);
	} /*getcurrenttimezonebias*/

