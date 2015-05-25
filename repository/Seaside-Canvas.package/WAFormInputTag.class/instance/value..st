attributes
value: anObject
	anObject isNil
		ifFalse: [ self attributes at: 'value' put: anObject ]