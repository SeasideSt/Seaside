tests
testPostFields
	| request headers |
	request := WARequest method: 'POST' uri: '/foo?bar=1'.
	headers := Dictionary new.
	headers at: 'content-type' put: WAMimeType formUrlencoded greaseString.
	request setHeaders: headers.
	request setBody: 'baz=2&bar=3'.
	request setPostFields: (WARequestFields new at: 'baz' put: '2'; at: 'bar' put: '3'; yourself).
	
	self assert: request postFields size = 2.
	self assert: (request postFields at: 'baz') = '2'.
	self assert: (request postFields at: 'bar') = '3'.
	self assert: request queryFields size = 1.
	self assert: (request queryFields at: 'bar') = '1'.
	self assert: request fields size = 3.
	self assert: (request fields at: 'bar') = '1'.
	self assert: (request fields at: 'baz') = '2'