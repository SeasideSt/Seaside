encoding
encodeQueryOn: aDocument 
	| first |
	first := true.
	self queryFields keysAndValuesDo: [ :key :value |
		first ifFalse: [ aDocument xmlEncoder nextPut: $& ].
		first := false.
		aDocument urlEncoder nextPutAll: key.
		value isNil ifFalse: [
			aDocument nextPut: $=.
			aDocument urlEncoder nextPutAll: value greaseString ] ]