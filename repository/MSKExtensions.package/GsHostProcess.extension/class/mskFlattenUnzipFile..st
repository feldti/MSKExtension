*MSKExtensions
mskFlattenUnzipFile: source
	"
		GsHostProcess 
			mskUnzipFile: '/var/www/fileswebcati/customers/test.txt'
		
	"
	|  aWriteStream  |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'unzip ' ;
		nextPutAll: ' -j ' ;
		nextPut: $' ;
		nextPutAll: source asString ;
		nextPut: $' ;
		nextPutAll: ' -d ' ;
		nextPut: $' ;
		nextPutAll: (source asString mskCopyUpToLastSubString: '/' startingAt: 1) ;
		nextPut: $'.

	^self mskPerformOnServer: aWriteStream contents