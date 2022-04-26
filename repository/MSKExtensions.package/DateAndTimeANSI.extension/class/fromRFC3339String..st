*MSKExtensions
fromRFC3339String: aString
	"YYYY-MM-DDTHH:MM:SS.ssss+/-0000

		DateAndTime fromRFC3339String: '2017-01-17T12:01:02Z'
		DateAndTime fromRFC3339String: '2017-01-17T12:01:02+01:00'
		DateAndTime fromRFC3339String: '2017-01-17T12:01:02-01:00'

		DateAndTime fromRFC3339String: '2017-01-17T12:01:02.123Z'
		(DateAndTime fromRFC3339String: '2017-01-17T12:01:02.123Z') seconds
	
		Duration days: 0 hours: 1 minutes: 1 seconds: 0

	"

	| year month dayOfMonth hours minute seconds offset readStream plusMinusCharacter |

	readStream := ReadStream on: aString.

	year := self _mskNumberWithDigits: 4 from: readStream.
	(readStream next ~= $-) ifTrue:[ self _errIncorrectFormat: aString ].
	month := self _mskNumberWithDigits: 2 from: readStream.
	(readStream next ~= $-) ifTrue:[ self _errIncorrectFormat: aString ].
	dayOfMonth := self _mskNumberWithDigits: 2 from: readStream.

	(readStream next ~= $T) ifTrue:[ self _errIncorrectFormat: aString  ].

	hours := self _mskNumberWithDigits: 2 from: readStream.
	(readStream next ~= $:) ifTrue:[ self _errIncorrectFormat: aString ].
	minute := self _mskNumberWithDigits: 2 from: readStream.
	(readStream next ~= $:) ifTrue:[ self _errIncorrectFormat: aString ].
	seconds := self _mskNumberWithDigits: 2 from: readStream.

	"fractionall part"
	readStream peek = $.
		ifTrue:[ 
			readStream next.
			seconds := seconds + (self _mskNumberUpToNonDigitFrom: readStream).
		].

	"get the +/- character or Z character"
	plusMinusCharacter := readStream next.
	plusMinusCharacter = $Z
		ifTrue:[ offset := Duration zero ]
		ifFalse:[
			| hOffset mOffset |
			hOffset  := self _mskNumberWithDigits: 2 from: readStream.
			(readStream next ~= $:) ifTrue:[ self _errIncorrectFormat: aString ].
			mOffset := self _mskNumberWithDigits: 2 from: readStream.
			offset := Duration days: 0 hours: hOffset minutes: mOffset seconds: 0.
			plusMinusCharacter = $- ifTrue:[ offset := offset negated ]
		].

	^self year: year month: month day: dayOfMonth hour: hours minute: minute second: seconds offset: offset