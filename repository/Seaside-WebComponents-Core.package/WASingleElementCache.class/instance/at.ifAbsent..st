accessing
at: aKey ifAbsent: aBlock
	^ key = aKey
		ifTrue: [ value ]
		ifFalse: [ aBlock value ]