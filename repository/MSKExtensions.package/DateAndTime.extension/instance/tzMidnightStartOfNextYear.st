*MSKExtensions
tzMidnightStartOfNextYear
	"Answer the midnight of the beginning of the next month

		| aDateTime |
		aDateTime := DateAndTime now. 
		(aDateTime asInTZNamed: 'Europe/Berlin') tzMidnightStartOfNextYear

	"

	^self class
		year: self year + 1
		day: 1
		hour: 0 
		minute: 0 
		second: 0 
		offset: self offset
