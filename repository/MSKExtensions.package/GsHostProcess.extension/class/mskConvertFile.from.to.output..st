*MSKExtensions
mskConvertFile: source from: sourceEncoding to: targetEncoding output: target
	"
		| encoding |
		encoding := 
			GsHostProcess mskCheckFileEncoding:  '/home/mf/development/wc_python_v6/data/mediumtest.csv' .
			GsHostProcess 
				mskConvertFile: '/home/mf/development/wc_python_v6/data/mediumtest.csv' 
				from: encoding
				to: 'UTF-8' 
				output: '/home/mf/development/wc_python_v6/data/mediumtest.utf8.csv' 
			

	"
	| output aWriteStream  |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'iconv -f' ;
		space ;
		nextPutAll: sourceEncoding ;
		space ;
		nextPutAll: '-t';
		space ;
		nextPutAll: targetEncoding ;
		space ; 
		nextPut: $' ;
		nextPutAll: source  ;
		nextPut: $' ;
		space ;
		nextPutAll: '-o';
		space ;
		nextPut: $' ;
		nextPutAll: target  ;
		nextPut: $' .
		
	output := System performOnServer: aWriteStream contents.
	^output
