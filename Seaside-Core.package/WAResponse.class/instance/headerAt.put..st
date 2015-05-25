accessing-headers
headerAt: aString put: aValue
	"Set a response header with aString and aValue. If the header had already been set, the new value overwrites the previous one."
	
	^ self headers at: aString put: aValue