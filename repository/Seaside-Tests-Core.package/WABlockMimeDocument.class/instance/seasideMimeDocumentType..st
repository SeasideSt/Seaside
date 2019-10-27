converting
seasideMimeDocumentType: aMimeType
	aMimeType = self mimeType
		ifTrue: [ ^ self ].
	^ self copy
		mimeType: aMimeType;
		yourself