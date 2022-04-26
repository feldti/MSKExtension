*MSKExtensions
_mskNumberWithDigits: numberOfDigits from: aStream
	"
			DateAndTime _mskNumberWithDigits: 4 from: (ReadStream on: '1234')
	"

	| number factor digitString |

	number := 0.
	factor := 1.

	digitString := aStream next: numberOfDigits.

	numberOfDigits to: 1 by: -1 do: [ :anIndex |
		| character |
		(character := digitString at: anIndex) isDigit
			ifFalse:[].

		number := number + (character numericValue * factor).
		factor := factor * 10.
	].

	^number