public
keyAtValue: anObject ifAbsent: absentBlock
	"Return the key at which anObject is stored. If anObject is not found in the
	cache, return the result of evaluating absentBlock.
	The block should not be evaluated within the mutex since it could take a long time."
	
	| key |
	key := mutex critical: [ keysByObject at: anObject ifAbsent: [ nil ] ].
	
	^ key ifNil: [ absentBlock value ]