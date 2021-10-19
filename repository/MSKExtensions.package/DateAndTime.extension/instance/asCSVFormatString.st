*MSKExtensions
asCSVFormatString
	"A small interpreter to get a date exactly the way required."
	"DateAndTime now asCSVFormatString"
	"Pharo only?"
	| code |
	code := #( year 4 $. monthIndex 2 $- dayOfMonth 2 $   hour 2 $: minute 2 $: second 2 ) readStream.
	^ String streamContents: [ :stream |
		[ code atEnd ] whileFalse: [
			stream nextPutAll: ((self perform: code next) asInteger
				printPaddedWith: $0 to: code next).
			code atEnd
				ifFalse: [ stream nextPut: code next ] ] ]
