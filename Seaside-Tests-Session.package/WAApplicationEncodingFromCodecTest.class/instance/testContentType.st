tests
testContentType
	self assert: handler contentType = ('text/html' seasideMimeType
		charset: 'iso-8859-1';
		yourself)