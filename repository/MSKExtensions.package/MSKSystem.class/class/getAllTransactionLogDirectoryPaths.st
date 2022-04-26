translog
getAllTransactionLogDirectoryPaths
	"MSKSystem getAllTransactionLogDirectoryPaths"

	^(System configurationAt: 'STN_TRAN_LOG_DIRECTORIES' ) 
		inject: Set new
		into: [ :set :each |
				(each notEmpty and: [ each first = $$ ])
					ifTrue:[
						| cutRight |
						cutRight := each last = $/ ifTrue:[ 1 ] ifFalse:[ 0 ].

						set add: (System gemEnvironmentVariable: (each copyFrom: 2 to: each size - cutRight))
					].
			set 
		]