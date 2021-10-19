*MSKExtensions
asInTZOffset: aDuration
	"Answer a <DateAndTime> that represents the same absolute time 
	as the receiver but in the time zone with specific offset

		| aDateTime |
		aDateTime := DateAndTime now .
		aDateTime = (aDateTime asInTZOffset: (Duration minutes: 60))

		| aDateTime |
		aDateTime := DateAndTime now .
		(aDateTime asInTZOffset: (Duration minutes: 60))

	"

	^self class
		secondsUTC: seconds
		offset: aDuration
