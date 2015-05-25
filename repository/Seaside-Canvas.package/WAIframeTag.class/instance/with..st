public
with: aBlock
	url isNil
		ifFalse: [ self attributes at: 'src' put: url ].
	super with: aBlock