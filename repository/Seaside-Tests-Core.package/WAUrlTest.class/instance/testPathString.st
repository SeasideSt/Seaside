tests-encoding
testPathString
	self assert: url pathString = '/'.

	url path: #( 'foo' 'bar' ).
	self assert: url pathString = '/foo/bar'