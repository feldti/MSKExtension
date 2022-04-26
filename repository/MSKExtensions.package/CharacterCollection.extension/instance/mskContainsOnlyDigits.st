*MSKExtensions
mskContainsOnlyDigits

	self isEmpty ifTrue:[ ^false ].
	self do:[ :eachCharacter | eachCharacter isDigit ifFalse:[ ^false ]].
	^true