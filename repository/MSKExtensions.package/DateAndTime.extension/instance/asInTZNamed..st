*MSKExtensions
asInTZNamed: timezoneName
	"Answer a <DateAndTime> that represents the same absolute time 
	as the receiver but in the time zone named timezoneName

		| aDateTime |
		aDateTime := DateAndTime now .
		aDateTime = aDateTime asUTC
	
		| aDateTime |
		aDateTime := DateAndTime now .
		aDateTime = (aDateTime asInTZNamed: 'Europe/Berlin')
	"

	| timezone |

	(timezoneName isNil or:[ timezoneName isEmpty ]) 
		ifTrue:[ timezone := TimeZone named: 'UTC' ]
		ifFalse:[ (timezone := TimeZone named: timezoneName) isNil ifTrue:[ timezone := TimeZone named: 'UTC' ] ].

	^self asInTZOffset: timezone offset
