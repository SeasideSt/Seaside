tests
testAbsoluteUrlForResourceWithoutBase
	| context |
	context := WARenderContext new.
	context resourceUrl: nil.
	self assert: (context absoluteUrlForResource: nil) isNil.
	self assert: ((context absoluteUrlForResource: 'bar') isKindOf: WAUrl).
	self assert: (context absoluteUrlForResource: 'bar') greaseString = '/bar'.
	self assert: ((context absoluteUrlForResource: '/bar') isKindOf: WAUrl).
	self assert: (context absoluteUrlForResource: '/bar') greaseString = '/bar'.
	self assert: ((context absoluteUrlForResource: '') isKindOf: WAUrl).
	self assert: (context absoluteUrlForResource: '') greaseString = '/'.
	self assert: ((context absoluteUrlForResource: 'http://localhost/foo') isKindOf: WAUrl).
	self assert: (context absoluteUrlForResource: 'http://localhost/foo') greaseString = 'http://localhost/foo'