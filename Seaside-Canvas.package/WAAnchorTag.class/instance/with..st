public
with: aBlock
	url isNil
		ifFalse: [ self attributes at: 'href' put: url ].
	super with: aBlock