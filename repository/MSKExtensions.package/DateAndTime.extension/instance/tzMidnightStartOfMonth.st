*MSKExtensions
tzMidnightStartOfMonth
	"Answer the midnight of the beginning of the month

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZNamed: 'Europe/Berlin') tzMidnightStartOfMonth

	"


	^self class
		year: self year 
		day: (self dayOfYear - self dayOfMonth + 1)
		hour: 0 
		minute: 0 
		second: 0 
		offset: self offset
