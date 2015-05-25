tests
testPathSqueakRegression
	"Tests a path that is made up of only WideStrings"
	| url |
	url := (WAUrl absolute: 'http://book.seaside.st/%E1%B8%83/%C3%A1%C4%8D')
		decodedWith: (GRCodec forEncoding: 'utf-8').
	self assert: url pathStringUnencoded =
		('/', (String with: (Character codePoint: 16r1E03)),
		'/', (String with: (Character codePoint: 225) with: (Character codePoint: 269)))