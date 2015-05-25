tests
testContentType
	file contentType: 'text/plain'.
	self assert: file contentType = 'text/plain' seasideMimeType.
	
	file contentType: 'text/plain' seasideMimeType.
	self assert: file contentType = 'text/plain' seasideMimeType.

	file contentType: nil.
	self assert: file contentType isNil