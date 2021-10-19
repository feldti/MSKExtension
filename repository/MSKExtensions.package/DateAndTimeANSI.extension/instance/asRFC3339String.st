*MSKExtensions
asRFC3339String
	"
		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02Z') asRFC3339String   '2017-01-17T12:01:02Z'
		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02+01:00') asRFC3339String  '2017-01-17T12:01:02+01:00'
		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02-01:00') asRFC3339String   '2017-01-17T12:01:02-01:00'

		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02.123Z') asRFC3339String  '2017-01-17T12:01:02.123Z'
		
	"
	^self asRFC3339String: false
