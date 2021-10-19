*MSKExtensions
tzMidnightStartOfNextMonth
	"Answer the midnight of the beginning of the next month

		| aDateTime |
		aDateTime := DateAndTime now. 
		(aDateTime asInTZNamed: 'Europe/Berlin') tzMidnightStartOfNextMonth

	"

	| newDate |

	newDate := (self date subtractDays: (self dayOfMonth - 1) ) addMonths: 1.

	^self class
		year: newDate year 
		day: newDate dayOfYear 
		hour: 0 
		minute: 0 
		second: 0 
		offset: self offset
