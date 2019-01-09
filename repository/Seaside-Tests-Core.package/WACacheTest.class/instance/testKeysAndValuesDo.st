testing
testKeysAndValuesDo
	| reference readBack |
	reference := Dictionary new.

	1 to: 100 do: [ :i |
		cache at: i put: i greaseString.
		reference at: i put: i greaseString ].
	
	readBack := Dictionary new.
	cache keysAndValuesDo: [ :key :value |
		readBack at: key put: value ].
	
	self assert: readBack = reference