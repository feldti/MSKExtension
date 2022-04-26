*MSKExtensions
asRFC3339String: useZTimezone
	"
		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02Z') asRFC3339String   '2017-01-17T12:01:02Z'
		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02+01:00') asRFC3339String  '2017-01-17T12:01:02+01:00'
		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02-01:00') asRFC3339String   '2017-01-17T12:01:02-01:00'

		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02.123Z') asRFC3339String  '2017-01-17T12:01:02.123Z'

	"
	| writeStream tmp truncatedValue  |

	writeStream := WriteStream on: String new.

	self printYMDOn: writeStream withLeadingSpace: false.
	writeStream nextPut: $T.
	(tmp := self hour24 abs) < 10 ifTrue: [writeStream nextPut: $0].
	tmp printOn: writeStream.
	writeStream nextPut: $:.
	(tmp := self minute abs) < 10 ifTrue: [writeStream nextPut: $0].
	tmp printOn: writeStream.
	writeStream nextPut: $:.
	(tmp := self second abs truncated) < 10 ifTrue: [writeStream nextPut: $0].
	tmp printOn: writeStream.
	truncatedValue := ((self second - self second truncated) * 1000) truncated.
	(truncatedValue > 0)
		ifTrue: [
			writeStream nextPut: $. .
			writeStream nextPutAll: (truncatedValue printPaddedWith: $0 to: 3)
		]
		ifFalse:[ writeStream nextPut: $. ; nextPutAll: '000' ].

	(self offset isZero and:[ useZTimezone ])
		ifTrue:[	writeStream nextPut: $Z ]
		ifFalse:[ 	self offset printOnHoursMinutes: writeStream 	].

	^writeStream contents