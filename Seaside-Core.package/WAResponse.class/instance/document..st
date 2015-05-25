documents
document: aDocument
	| document mimeType |
	document := aDocument seasideMimeDocument.
	self attachmentWithFileName: document fileName.
	mimeType := document mimeType.
	self contentType: mimeType.
	mimeType isBinary
		ifTrue: [ self binary ].
	self nextPutAll: document content