public
with: aString 
	self attributes 
		at: 'type'
		ifAbsentPut: [ 'text/javascript' ].
	super with: [
		aString isNil ifFalse: [
			self document nextPutAll: aString greaseString ] ]