Extension { #name : 'WABufferedResponseTest' }

{ #category : '*seaside-tests-utf8' }
WABufferedResponseTest >> asString: aCollectionOfIntegers [
	^ String streamContents: [ :stream |
		aCollectionOfIntegers do: [ :each |
			stream nextPut: (Character codePoint: each) ] ]
]

{ #category : '*seaside-tests-utf8' }
WABufferedResponseTest >> decodedUnicodeString [
	^ self asString: #(252 116 102 45 56)
]

{ #category : '*seaside-tests-utf8' }
WABufferedResponseTest >> encodedUnicodeString [
	^ self asString: #(195 188 116 102 45 56)
]

{ #category : '*seaside-tests-utf8' }
WABufferedResponseTest >> testResetKeepsStreamKind [
	| resetPossible codec |
	codec := GRCodec forEncoding: 'utf-8'.
	response := WABufferedResponse
		on: (codec
			encoderFor: (GRPlatform current writeCharacterStreamOn: codec encodedStringClass new)).
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
]

{ #category : '*seaside-tests-utf8' }
WABufferedResponseTest >> unicodeString [
	^ self asString: 'ütf-8'
]
