tests-encoding
testPathString
	self assert: (url pathStringEncodedWith: GRNullCodec new) = '/'.

	url path: #( 'foo' 'bar' ).
	self assert: (url pathStringEncodedWith: GRNullCodec new) = '/foo/bar'