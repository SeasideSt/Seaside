tests
testBodyDecoded
	| request headers |
	request := WARequest method: 'POST' uri: '/foo?bar=1'.
	request setBody: 'baz=2&bar=3' utf8Encoded.
	self should: [ request bodyDecoded ] raise: WAIllegalStateException.
	
	headers := Dictionary new.
	headers at: 'content-type' put: (WAMimeType formUrlencoded charset: 'utf-8'; yourself) greaseString.
	request setHeaders: headers.

	self assert: request bodyDecoded equals: 'baz=2&bar=3'.
	
	request setBody: nil.
	self assert: request bodyDecoded equals: nil