public
with: aString

	self attributes
		at: 'type'
		ifAbsentPut: [ 'text/javascript' ].
	super with: [
		aString ifNotNil: [
			self document nextPutAll: aString greaseString ] ]