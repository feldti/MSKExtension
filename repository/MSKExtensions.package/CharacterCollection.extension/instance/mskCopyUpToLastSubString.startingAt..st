*MSKExtensions
mskCopyUpToLastSubString: subString startingAt: startIndex
	"

		'/var/www/html/index.html' mskCopyUpToLastSubString: '/' startingAt: 1

		'/var/www/html/index.html' findLastOccuranceOfString: '/' startingAt: 1


	"
	| indexFound |

	(indexFound := self findLastOccuranceOfString: subString startingAt: startIndex) = 0 ifTrue:[ ^self copy ].
	^self copyFrom: startIndex to: (indexFound - 1)