*MSKExtensions
inServerDirectory: aPath withAllDirectoryNamesDo: aBlock

	| contents |

	contents := (self contentsAndTypesOfDirectory: aPath onClient: false).

	1 to: contents size by: 2 do: [:i | | path dirFlag nm  |
		path := (contents at: i) asUnicodeString.
		nm := (path findTokens: '/\') last.
		((nm ~= '.') _and: [nm ~= '..'])
			ifTrue: [
				dirFlag := (contents at: i + 1) not.
				dirFlag ifTrue:[ 	aBlock value: path ]
			]
	].
