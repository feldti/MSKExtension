*MSKExtensions
tzStartOfHour
	"Answer the midnight of tomorrow - but keeping the same timezone

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZNamed: 'Europe/Berlin') tzStartOfHour

	"

	^self class
		year: self year 
		day: self dayOfYear 
		hour: self hour24 
		minute: 0 
		second: 0 
		offset: self offset