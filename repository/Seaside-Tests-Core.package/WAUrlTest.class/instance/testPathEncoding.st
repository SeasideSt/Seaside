tests-encoding
testPathEncoding
	url path: #( 'foo/bar' ).
	self assert: url printString = '/foo%2Fbar'.

	url path: #( 'foo bar' ).
	self assert: url printString = '/foo%20bar'.

	url path: #( 'foo+bar' ).
	self assert: url printString = '/foo%2Bbar'.

	url path: #( 'foo%bar' ).
	self assert: url printString = '/foo%25bar'