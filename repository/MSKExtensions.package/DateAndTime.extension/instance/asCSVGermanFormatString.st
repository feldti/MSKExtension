*MSKExtensions
asCSVGermanFormatString
	"A small interpreter to get a date exactly the way required."
	"DateAndTime now asCSVGermanFormatString '"
	"Pharo only?"
	| code |
	code := #( dayOfMonth 2 $. monthIndex 2 $. year 4 $   hour 2 $: minute 2 $: second 2 ) readStream.
	^ String streamContents: [ :stream |
		[ code atEnd ] whileFalse: [
			stream nextPutAll: ((self perform: code next) asInteger
				printPaddedWith: $0 to: code next).
			code atEnd
				ifFalse: [ stream nextPut: code next ] ] ]
