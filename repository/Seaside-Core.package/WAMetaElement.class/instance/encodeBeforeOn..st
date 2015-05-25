printing
encodeBeforeOn: aDocument
	self attributes at: 'content' ifAbsentPut: [ '' ].
	super encodeBeforeOn: aDocument