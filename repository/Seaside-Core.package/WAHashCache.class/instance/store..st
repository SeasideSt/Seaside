putting
store: anObject
	| candidateKey |
	[ 
		candidateKey := WAKeyGenerator current keyOfLength: self keySize.
		self at: candidateKey put: anObject overwrite: false ] whileFalse.
	^ candidateKey