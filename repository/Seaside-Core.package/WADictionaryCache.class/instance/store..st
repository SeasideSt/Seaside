putting
store: anObject
	| candidateKey |
	[ 
		candidateKey := WAKeyGenerator current keyOfLength: self keySize.
		self includesKey: candidateKey ] whileTrue.
	self at: candidateKey put: anObject.
	^ candidateKey