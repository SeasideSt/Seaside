printing
encodeOn: aDocument
	self encodeBeforeOn: aDocument.
	self isClosed ifTrue: [ ^ self ].
	self encodeChildrenOn: aDocument.
	self encodeAfterOn: aDocument