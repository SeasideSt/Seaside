*seaside-tests-utf8
testResetKeepsStreamKind
	| resetPossible |
	response := WABufferedResponse
		on: ((GRCodec forEncoding: 'utf-8')
			encoderFor: (GRPlatform current writeCharacterStreamOn: String new)).
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the wrong content';
		resetIfPossible.
	self assert: resetPossible.
	self response
		status: WAResponse statusImATeapot;
		headerAt: 'X-The-Header' put: 'the value';
		nextPutAll: self decodedUnicodeString.
	self assertLines: (Array
		with: 'HTTP/1.1 418 I''m a teapot'
		with: 'X-The-Header: the value'
		with: 'Content-Length: 6'
		with: ''
		with: self encodedUnicodeString)