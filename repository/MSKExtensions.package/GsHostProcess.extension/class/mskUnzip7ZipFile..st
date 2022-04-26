*MSKExtensions
mskUnzip7ZipFile: source
	"
		GsHostProcess 
			mskUnzipFile: '/var/www/fileswebcati/customers/test.txt'
		
	"
	|  aWriteStream  |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: '7z x ' ;
		nextPut: $' ;
		nextPutAll: source asString ;
		nextPut: $' ;
		nextPutAll: ' -o' ;
		nextPut: $' ;
		nextPutAll: (source asString mskCopyUpToLastSubString: '/' startingAt: 1) ;
		nextPut: $'.

	^self mskPerformOnServer: aWriteStream contents.