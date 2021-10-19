*MSKExtensions
mskPerformOnServer: aString

"This method causes the operating system commands in aString to be executed as
 a spawned subprocess.  Generates an error if aString cannot be executed by the
 operating system.

 Under Unix, commands in aString can have exactly the same form as a shell
 script.  For example, newlines or semicolons can separate commands, and a
 backslash can be used as an escape Character.

 Returns the stdout result of the spawned process as a String .
 If the result is actually UTF8 data, the application must determine
 when to send decodeFromUTF8 to the result.

 Signals an error if the privilege NoPerformOnServer is true."

| resultStr arr childStatus |
arr := System _performOnServer: aString .
resultStr := arr at: 3 .
  childStatus := arr at: 2 .
(resultStr isNil or:[ childStatus > 0 ]) 
	ifTrue:[  | rawStatus  errno errMsg |
		rawStatus := arr at: 1 .
		errno := arr at: 5 . 
		(errMsg := arr at: 4) isNil
			ifTrue:[ aString _error: #hostErrPerform args:{ resultStr . errno . rawStatus . childStatus } ]
			ifFalse:[ aString _error: #hostErrPerform args:{ errMsg . errno . rawStatus . childStatus } ].
		^ nil
	].

resultStr _stringCharSize == 0 ifTrue:[ 
  ^ resultStr decodeToString  "decode a Utf8"
].
^ resultStr
