*MSKExtensions
tzTomorrowMidnight
	"Answer the midnight of tomorrow - but keeping the same timezone

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZNamed: 'Europe/Berlin') tzTomorrowMidnight

	"


	^self tzMidnight + (Duration days: 1)