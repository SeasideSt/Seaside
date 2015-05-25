public
remove: anObject ifAbsent: absentBlock
	"Remove anObject from the cache, returning the removed object. If the object is not
	found in the cache,	return the result of evaluating absentBlock.
	The block should not be evaluated within the mutex since it could take a long time."
	
	| key |
	mutex critical: [
		key := keysByObject at: anObject ifAbsent: [ nil ].
		key isNil ifFalse: [
			keysByObject removeKey: anObject ifAbsent: [ nil ].
			objectsByKey removeKey: key ifAbsent: [ nil ].
			self notifyRemoved: anObject key: key ] ].
		
	^ key isNil ifTrue: [ absentBlock value ] ifFalse: [ anObject ]