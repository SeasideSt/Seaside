putting
store: anObject
	key := WAKeyGenerator current keyOfLength: self keySize.
	value := anObject.
	^ key