*MSKExtensions
mskAsNormalDecimalCommaNumber
	"^<String> Returns a float with the US comma - but with at least one post zero comma digit (if needed)

		2.0 mskAsNormalDecimalCommaNumber 
		12343.0000 mskAsNormalDecimalCommaNumber
		0.001 mskAsNormalDecimalCommaNumber 

	"
	^self mskAsNormalFrom: $. to: $,