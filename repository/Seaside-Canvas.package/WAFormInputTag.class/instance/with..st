public
with: aBlock
	self type isNil ifFalse: [
		self attributes at: 'type' ifAbsentPut: [ self type ] ].
	super with: aBlock