testing
testKeysAndValuesDo
	| reference readBack |
	reference := Dictionary new.

	cache at: 1 put: 'one'.
	reference at: 1 put: 'one'.
	
	readBack := Dictionary new.
	cache keysAndValuesDo: [ :key :value |
		readBack at: key put: value ].
	
	self assert: readBack = reference