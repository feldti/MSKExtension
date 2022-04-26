*MSKExtensions
mskAsNormalFrom: fromCharacter to: toCharacter
	"^<String> Returns a float with the US comma - but with at least one post zero comma digit (if needed)

		2.0 mskAsNormalUSFloatString 
		12343.0000 mskAsNormalUSFloatString
		0.001 mskAsNormalUSFloatString 

	"
	| formattedNumberString preCommaDigits format |

	"to get the needed precision"
	preCommaDigits := self truncated asString size.

	"define the format for base printout"
	format := Array with: 10 with: (16 - preCommaDigits) with: false.

	"change the comma representation according to your need"
	formattedNumberString := ((self asStringUsingFormat: format) copyReplaceChar: fromCharacter with: toCharacter ) trimBlanks.

	"if the system has a comma -> throw away all following zeros "
	(formattedNumberString indexOf: toCharacter startingAt: 1) > 0
		ifTrue:[ formattedNumberString := formattedNumberString  trimRight: [ :aChar | aChar = $0 ] ].

	(formattedNumberString last = toCharacter) ifTrue:[ formattedNumberString := formattedNumberString,'0' ].

	^formattedNumberString