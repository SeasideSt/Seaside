accessing
at: key ifAbsent: aBlock
	^ self fields at: key ifAbsent: aBlock