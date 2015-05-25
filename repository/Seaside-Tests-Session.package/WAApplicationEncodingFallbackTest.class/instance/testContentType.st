tests
testContentType
	self assert: handler contentType = ('text/html' seasideMimeType
		charset: 'utf-16';
		yourself)