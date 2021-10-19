*MSKExtensions
tzMidnight
	"Answer the midnight of the receiver - but keeping the same timezone

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZNamed: 'Europe/Berlin') tzMidnight

	"


	^self class
		year: self year 
		day: self dayOfYear 
		hour: 0 
		minute: 0 
		second: 0 
		offset: self offset
