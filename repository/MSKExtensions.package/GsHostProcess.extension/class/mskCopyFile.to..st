*MSKExtensions
mskCopyFile: source to: target
	"
		GsHostProcess 
			mskCopyFile:  '/var/www/fileswebcati/customers/test.txt'
			to:  '/var/www/fileswebcati/customers44/test2.txt'

	"
	| aGsHostProcess output aWriteStream  |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'cp ' ;
		nextPut: $' ;
		nextPutAll: source asString ;
		nextPut: $' ;
		space ;
		nextPut: $' ;
		nextPutAll: target asString ;
		nextPut: $'.

	^System performOnServer: aWriteStream contents.