public
with: anObject 
	anObject isNil ifFalse: [ self value: anObject greaseString ].
	super with: nil