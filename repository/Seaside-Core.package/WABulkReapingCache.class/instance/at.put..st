putting
at: aKey put: anObject
	| present value |
	present := false.
	value := WABulkReapingCacheEntry value: anObject.
	dictionary
		at: aKey
		ifAbsentPut: [ present := true. value ].
	present ifTrue: [
		^ anObject ].
	dictionary at: aKey put: value.
	^ anObject