*MSKExtensions
tzYesterdayMidnight
	"Answer the midnight of tomorrow - but keeping the same timezone

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZNamed: 'Europe/Berlin') tzYesterdayMidnight

	"


	^self tzMidnight - (Duration days: 2) + (Duration seconds: 86400)