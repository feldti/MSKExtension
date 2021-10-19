*MSKExtensions
mskCSVCleanedText
	"^<self> Returns a string without $; and without any character <= $  "

	^self collect:[ :each | 
			each = $; 	
				ifTrue:[ $ ]
				ifFalse:[ each < $ ifTrue:[ $ ] ifFalse:[ each ]]
		]
