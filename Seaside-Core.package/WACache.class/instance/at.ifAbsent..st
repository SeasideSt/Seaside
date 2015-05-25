public
at: aString ifAbsent: absentBlock
	"Return the object stored at the key aString. If the key is not found in the
	cache, return the result of evaluating absentBlock.
	The block should not be evaluated within the mutex since it could take a long time."
	
	| object |
	mutex critical: [
		object := objectsByKey at: aString ifAbsent: [ self missStrategy missed: aString ].
		object isNil ifFalse: [
			(self expiryPolicy isExpired: object key: aString)
				ifTrue: [
					"Should we remove the object here?"
					object := nil ]
				ifFalse: [ self notifyRetrieved: object key: aString ] ] ].
	
	^ object ifNil: [ absentBlock value ]