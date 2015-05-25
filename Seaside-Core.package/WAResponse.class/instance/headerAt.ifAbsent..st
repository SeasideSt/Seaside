accessing-headers
headerAt: aString ifAbsent: aBlock
	"Answer the header with aString, if none answer the result of evaluating aBlock."
	
	^ self headers at: aString ifAbsent: aBlock