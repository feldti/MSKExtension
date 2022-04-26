*MSKExtensions
mskStringWithSeparator: aCharacter

	| resultStream addDelimiter |

	self isEmpty ifTrue:[ ^'' ].

	resultStream := WriteStream on: (self first class new).
	addDelimiter := false.

	self do: [ :eachString | 
		addDelimiter ifTrue:[ resultStream nextPut: aCharacter ].
		resultStream nextPutAll: eachString.
		addDelimiter := true.
	].


	^resultStream contents