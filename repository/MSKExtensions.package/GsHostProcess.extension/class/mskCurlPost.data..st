*MSKExtensions
mskCurlPost: url data: aString
	"
		GsHostProcess 
			mskCurlPost: url 
			data: aString
			

	"
	| output aWriteStream   |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'curl  ' ;
		nextPutAll: '-H "Content-Type: application/json" ' ;
		nextPutAll: '-d ' ;
		nextPut: $' ;
		nextPutAll: aString asString ;
		nextPut: $'.
		
	output := System performOnServer: aWriteStream contents.

	^(ReadStream on: output trimBlanks trimSeparators asLowercase) upTo: $/