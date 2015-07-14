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
	dictionary
		at: aKey
		ifPresent: [ :entry |
			self cacheEntryRemoved: entry value.
			entry value: anObject ].
	^ anObject