*MSKExtensions
mskAsNormalDecimalPointNumber
	"^<String> Returns a float with a decimal point

		2.0 mskAsNormalDecimalPointNumber 
		12343.0000 mskAsNormalDecimalPointNumber
		0.001 mskAsNormalDecimalPointNumber 

	"
	^self mskAsNormalFrom: $, to: $.