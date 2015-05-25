tests
testPathStringUnencoded
	| url |
	url := (WAUrl absolute: 'http://book.seaside.st/book/%C3%A1%C4%8D')
		decodedWith: (GRCodec forEncoding: 'utf-8').
	self assert: url pathStringUnencoded =  ('/book/', (String with: (Character codePoint: 225) with: (Character codePoint: 269)))