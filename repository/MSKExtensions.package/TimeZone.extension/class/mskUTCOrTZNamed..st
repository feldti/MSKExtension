*MSKExtensions
mskUTCOrTZNamed: timezoneName

	| timezone |

	(timezoneName isNil or:[ timezoneName isEmpty ]) 
		ifTrue:[ timezone := TimeZone named: 'UTC' ]
		ifFalse:[ (timezone := TimeZone named: timezoneName) isNil ifTrue:[ timezone := TimeZone named: 'UTC' ] ].

	^timezone