*MSKExtensions
mskCopyDirectory: source to: target
	"
		GsHostProcess 
			mskCopyDirectory:  '/var/www/fileswebcati/customers/test.txt'
			to:  '/var/www/fileswebcati/customers44/test2.txt'

	"
	|   aWriteStream  |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'cp -r ' ;
		nextPut: $' ;
		nextPutAll: source asString ;
		nextPut: $' ;
		space ;
		nextPut: $' ;
		nextPutAll: target asString ;
		nextPut: $'.

	^System performOnServer: aWriteStream contents.