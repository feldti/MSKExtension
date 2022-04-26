*MSKExtensions
mskStartWithUppercase

	self isEmpty ifTrue:[ ^self ].
	^(self copyFrom: 1 to: 1) asUppercase,(self copyFrom: 2 to: self size)