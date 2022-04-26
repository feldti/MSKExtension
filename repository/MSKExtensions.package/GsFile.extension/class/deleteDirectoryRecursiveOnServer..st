*MSKExtensions
deleteDirectoryRecursiveOnServer: aPath

	| contents |

	(contents := (GsFile contentsAndTypesOfDirectory: aPath onClient: false)) isNil ifTrue:[ ^nil ].

	1 to: contents size by: 2 do: [:i | | path dirFlag nm  |
		path := (contents at: i) asUnicodeString.
		nm := (path findTokens: '/\') last.
		((nm ~= '.') _and: [nm ~= '..'])
			ifTrue: [
				dirFlag := (contents at: i + 1) not.
				dirFlag 
					ifTrue:[ 	(self deleteDirectoryRecursiveOnServer: path) isNil ifTrue:[ ^nil ] ]
					ifFalse:[	(GsFile removeServerFile: path) isNil ifTrue:[ ^nil ] ]
			]
	].

	contents := (GsFile contentsAndTypesOfDirectory: aPath onClient: false).

	"removes the empty directory"
	(contents size = 4) ifTrue:[ ^GsFile removeServerDirectory: aPath ].