*MSKExtensions
tzWithHours
	"Answer a copy of the receiver - but minutes and seconds set to 0 - but keeping the same timezone

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZNamed: 'Europe/Berlin') tzWithHours

	"


	^self class
		year: self year 
		day: self dayOfYear 
		hour: self hour24 
		minute: 0 
		second: 0 
		offset: self offset
