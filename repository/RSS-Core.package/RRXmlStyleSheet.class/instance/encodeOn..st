printing
encodeOn: aDocument
	aDocument nextPutAll: '<?xml-stylesheet'.
	
	attributes encodeOn: aDocument.
	self childrenDo: [ :each | each encodeOn: aDocument ].
	
	aDocument nextPutAll: '?>'