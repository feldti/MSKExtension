*MSKExtensions
msklog: aString info: infoString

	| writeStream now |

	writeStream := WriteStream on: String new.
	now := DateAndTime now asUTC.
	writeStream
		nextPutAll: now asLogSortableString ;
		space ;
		nextPutAll: infoString ;
		nextPutAll: ' (UTC): ' ;
		nextPutAll: aString.

	GsFile gciLogServer: writeStream contents
