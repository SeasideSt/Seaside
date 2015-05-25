public
with: anObject
	anObject isNil
		ifFalse: [ value := anObject ].
	closed := true