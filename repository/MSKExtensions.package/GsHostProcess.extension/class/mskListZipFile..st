*MSKExtensions
mskListZipFile: source
	"^<Array of String>

		GsHostProcess 
			mskListZipFile: '/home/mf/distribution.zip'
		
	"
	|  aWriteStream output  files startIndex |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: 'unzip -l ' ;
		nextPut: $' ;
		nextPutAll: source asString ;
		nextPut: $'.

	"
Archive:  distribution.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
        0  2017-08-07 14:04   swrbwi/
    10947  2017-08-07 10:01   swrbwi/analysen.html
    16985  2017-08-07 17:03   swrbwi/analysen.js
    10932  2017-08-07 10:01   swrbwi/bundesergebnisse.html
    14351  2017-08-07 17:03   swrbwi/bundesergebnisse.js
    14353  2017-08-07 17:03   swrbwi/bundle.js
    10893  2017-08-07 10:01   swrbwi/index.html
	"
	files := Array new.

	output := ReadStream on: (self mskPerformOnServer: aWriteStream contents).
	startIndex := -1.
	[ output atEnd ] whileFalse:[
		| nextLine |
		nextLine := output nextLine.
		(startIndex <= 0 and:[ nextLine size >= 4 ])
			ifTrue:[ startIndex :=  ((nextLine copyFrom: (nextLine size - 3) to: nextLine size) =  '----' ) ifTrue:[ nextLine size - 4 ] ifFalse:[ -1 ] ]
			ifFalse:[
				| fileName |

				fileName := (nextLine copyFrom: startIndex to: nextLine size) trimBlanks.

				fileName last ~= $/
					ifTrue:[ files add: fileName ]
			]
	].


	^files
