*MSKExtensions
mskSetLinkName: linkName in: linkBaseDirectoryPath to: directoryPath
	"
		GsHostProcess 
			mskCopyFile:  '/var/www/fileswebcati/customers/test.txt'
			to:  '/var/www/fileswebcati/customers44/test2.txt'

	"
	|   aWriteStream  |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'rm ' ;
		nextPutAll: linkBaseDirectoryPath ;
		nextPutAll: '/' ;
		nextPutAll: linkName ;
		nextPutAll: '; ln -s ' ;
		nextPutAll: directoryPath ;
		space ;
		nextPutAll: linkBaseDirectoryPath ;
		nextPutAll: '/' ;
		nextPutAll: linkName.

	^System performOnServer: aWriteStream contents.
