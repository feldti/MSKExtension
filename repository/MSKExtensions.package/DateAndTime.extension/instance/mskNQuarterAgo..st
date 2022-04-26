*MSKExtensions
mskNQuarterAgo: anInteger
	"^<Array of: DateAndTime of: DateAndTime> Returns the begin (inclusive) and the end of n quarters ago (exclusive)"

	| startTS endTS startMonth startYear currentQuarterIndex  startMonthIndex tempStartTS|


	startMonth := self month.
	startYear := self year.

	"1 => 1, 2 => 1, 3 => 1, 4 => 4 ..."
	currentQuarterIndex := (self month / 4) truncated + 1.
	startMonthIndex := (currentQuarterIndex - 1) * 3 + 1.

	startTS := DateAndTime year: startYear month: startMonthIndex day: 15.
	tempStartTS := startTS - (Duration days: (anInteger * 90)).

	startTS := DateAndTime year: tempStartTS year month: tempStartTS month day: 1.

	tempStartTS := tempStartTS + (Duration days: 90).

	endTS := DateAndTime year: tempStartTS year month: tempStartTS month day: 1.
	
	^Array with: startTS with: endTS