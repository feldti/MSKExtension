*MSKExtensions
mskExchangeFileExtensionWith: newExtension
	"
		'test.csv' mskExchangeFileExtensionWith: '.utf8.csv'
	"

	| indexFound |

	(indexFound := self findLastOccuranceOfString: '.' startingAt: 1) = 0 ifTrue:[ ^self  ].
	^(self copyFrom: 1 to: indexFound - 1),newExtension
