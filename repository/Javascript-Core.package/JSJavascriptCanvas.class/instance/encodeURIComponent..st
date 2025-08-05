public
encodeURIComponent: anObject
	self document encodeURIComponent.
	self document nextPut: $(.
	self render: anObject.
	self document nextPut: $)