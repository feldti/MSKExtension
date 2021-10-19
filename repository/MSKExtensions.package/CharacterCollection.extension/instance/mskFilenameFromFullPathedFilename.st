*MSKExtensions
mskFilenameFromFullPathedFilename
	"
		'/var/www/test/hallo.txt' mskFilenameFromFullPathedFilename
	"

	| indexFound |

	"if no / is available then we assume the receiver is the file name only"
	(indexFound := self findLastOccuranceOfString: '/' startingAt: 1) = 0 ifTrue:[ ^self  ].
	"if / is the last character we assume a wrong structure"
	indexFound = self size ifTrue:[ ^nil].
	"copy the rest as the result"
	^(self copyFrom: indexFound + 1 to: self size)
