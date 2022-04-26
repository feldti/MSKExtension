*MSKExtensions
mskList7ZipFile: source
	"
		GsHostProcess 
			mskList7ZipFile: '/home/mf/addresses_100000_pm.csv.7z'
		
	"
	|  aWriteStream files output  pattern patternSize sizeStart  sizeEnd nameStartIndex attrStartIndex attrEndIndex inContent |

	aWriteStream := WriteStream on: String new.
	aWriteStream
		nextPutAll: '7z l ' ;
		nextPut: $' ;
		nextPutAll: source asString ;
		nextPut: $'.

	files := Array new.

	output := ReadStream on: (self mskPerformOnServer: aWriteStream contents).

	pattern := '------------------- ----- ------------ ------------  ------------------------'.
	sizeStart := '------------------- ----- -' size.
	sizeEnd := '------------------- ----- ------------' size.
	nameStartIndex := '------------------- ----- ------------ ------------  -' size.
	attrStartIndex := '------------------- -' size.
	attrEndIndex := '------------------- -----' size.

	patternSize := pattern size.
	inContent := false.

	[ output atEnd ] whileFalse:[
		| nextLine |
		(nextLine := output nextLine) isEmpty 
			ifFalse:[ 
				nextLine = pattern 
					ifTrue:[ inContent := inContent not ]
					ifFalse:[ 
						(inContent and:[ nextLine size > nameStartIndex ])  ifTrue:[
							|  attribute |

							((attribute := nextLine copyFrom: attrStartIndex to: attrEndIndex) includesString: 'D')
								ifFalse:[ files add:  (nextLine copyFrom: nameStartIndex to: nextLine size) ].					
						].
					]
			]
	].

	^files