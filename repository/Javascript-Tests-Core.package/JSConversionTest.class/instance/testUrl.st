tests
testUrl
	self
		assert: (WAUrl absolute: 'http://www.seaside.st/?1=a&2=b')
		equals: '"http://www.seaside.st/?1=a&2=b"'