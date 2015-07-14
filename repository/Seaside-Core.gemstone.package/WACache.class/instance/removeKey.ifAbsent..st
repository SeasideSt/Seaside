public
removeKey: aString ifAbsent: absentBlock
	"Remove the object stored at the key aString and return the removed object. If the key
	is not found in the cache, return the result of evaluating absentBlock.
	The block should not be evaluated within the mutex since it could take a long time."
	
	| object |
	mutex critical: [
		object := objectsByKey removeKey: aString ifAbsent: [ nil ].
		keysByObject removeKey: object ifAbsent: [ nil ].
		object isNil ifFalse: [ self notifyRemoved: object key: aString ] ].
	
	^ object ifNil: [ absentBlock value ]