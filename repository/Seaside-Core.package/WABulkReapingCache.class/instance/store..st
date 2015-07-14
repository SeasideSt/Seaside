putting
store: anObject
	| candidateKey value |
	value := WABulkReapingCacheEntry value: anObject.
	[ 
		| written |
		written := false.
		candidateKey := WAKeyGenerator current keyOfLength: self keySize.
		dictionary at: candidateKey ifAbsentPut: [ written := true. value ].
		written ] whileFalse.
	^ candidateKey