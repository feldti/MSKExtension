*MSKExtensions
mskAppendFileExtensionWith: newExtension
	"
		'test.csv' mskAppendFileExtensionWith: 'utf8'
	"

	| indexFound |

	(indexFound := self findLastOccuranceOfString: '.' startingAt: 1) = 0 ifTrue:[ ^self  ].
	^(self copyFrom: 1 to: indexFound),newExtension,(self copyFrom: indexFound to: self size)
