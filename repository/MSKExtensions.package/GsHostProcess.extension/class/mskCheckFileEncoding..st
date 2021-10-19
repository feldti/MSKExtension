*MSKExtensions
mskCheckFileEncoding: source 
	"
		GsHostProcess 
			mskCheckFileEncoding:  '/home/mf/Schreibtisch/217055.csv' 
			

	"
	| output aWriteStream   |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'uchardet ' ;
		nextPut: $' ;
		nextPutAll: source asString ;
		nextPut: $'.
		
	output := System performOnServer: aWriteStream contents.

	^(ReadStream on: output trimBlanks trimSeparators asLowercase) upTo: $/
