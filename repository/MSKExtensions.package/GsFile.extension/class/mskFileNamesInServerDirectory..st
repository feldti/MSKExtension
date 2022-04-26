*MSKExtensions
mskFileNamesInServerDirectory: dirSpec
	"
		self halt.
		GsFile mskFileNamesInServerDirectory: '/var/esv3/disp-in-wdr/'

	"

	"Returns a list of filenames"

	| dirContents result path |

	path := dirSpec last = '/' ifTrue:[ dirSpec ] ifFalse:[ dirSpec,'/' ].


  dirContents := self _contentsOfServerDirectory: path expandPath: false  utf8Results: true .
  dirContents _isSmallInteger ifTrue:[ ^ nil ].
  result := { }  .
  1 to: dirContents size do:[:n | | elem aGsFileStat |
    elem := (dirContents at: n) asUnicodeString.
    ((aGsFileStat := GsFile stat: (path,elem) isLstat: false) _isSmallInteger not and:[aGsFileStat isDirectory not ]) 
			ifTrue:[ result add: elem ] 
  ].

^ result