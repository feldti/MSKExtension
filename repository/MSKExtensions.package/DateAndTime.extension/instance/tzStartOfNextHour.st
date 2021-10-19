*MSKExtensions
tzStartOfNextHour
	"Answer the midnight of tomorrow - but keeping the same timezone

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZNamed: 'Europe/Berlin') tzStartOfNextHour

	"

	^self tzStartOfHour + (Duration hours: 1)
