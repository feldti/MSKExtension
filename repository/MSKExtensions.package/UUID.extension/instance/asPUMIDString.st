*MSKExtensions
asPUMIDString
	""

	| num candidate |
	num := 0.
	1 to: self size do: [:i | num := num + ((256 raisedTo: i - 1) * (self at: i))].
	^num pumPrintStringRadix: 62 showRadix: false