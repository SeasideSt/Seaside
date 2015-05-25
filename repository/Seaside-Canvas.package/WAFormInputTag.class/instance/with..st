public
with: aBlock
	self type isNil ifFalse: [
		self attributes at: 'type' ifAbsentPut: [ self type ].
		self class: self type ].
	super with: aBlock