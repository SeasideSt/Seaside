testing
testMimetypeForRequest
	| request |
	request := self requestWithUrl: '/culture/pictures/cleopatra.jpeg'.
	self assert: (fileSystem mimetypeForRequest: request) = 'image/jpeg' seasideMimeType.
	
	request := self requestWithUrl: '/culture/pictures/cleopatra'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/octet-stream' seasideMimeType.
	
	request := self requestWithUrl: '/culture/pictures/cleopatra.'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/octet-stream' seasideMimeType.
	
	request := self requestWithUrl: '/'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/octet-stream' seasideMimeType.
	
	request := self requestWithUrl: '/culture/pictures/cleopatra.js'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/x-javascript' seasideMimeType.