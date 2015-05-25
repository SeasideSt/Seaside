tests
testContentType
	self response contentType: WAMimeType textHtml.
	self assert: self response contentType = WAMimeType textHtml.
	
	self response contentType: WAMimeType imagePng.
	self assert: self response contentType = WAMimeType imagePng