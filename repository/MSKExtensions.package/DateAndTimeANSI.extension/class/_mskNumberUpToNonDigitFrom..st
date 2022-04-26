*MSKExtensions
_mskNumberUpToNonDigitFrom: readStream
	"
			DateAndTime _mskNumberUpToNonDigitFrom: (ReadStream on: '123456')
	"

	|  numberString |

	numberString := WriteStream on: String new.
	numberString 
		nextPut: $0 ;
		nextPut: $. .

	[ readStream atEnd not and:[ readStream peek isDigit ]] whileTrue:[
		numberString nextPut: readStream next
	].

	^(Float fromStringLocaleC: numberString contents)