putting
store: anObject
	| candidateKey |
	[ 
		| written |
		written := false.
		candidateKey := WAKeyGenerator current keyOfLength: self keySize.
		dictionary at: candidateKey ifAbsentPut: [ written := true. anObject ].
		written ] whileFalse.
	^ candidateKey