*MSKExtensions
mskAsRGBAValue

	^((self red * 255) rounded asInteger << 24) + ((self green * 255) rounded asInteger << 16) + ((self blue * 255) rounded asInteger << 8)
