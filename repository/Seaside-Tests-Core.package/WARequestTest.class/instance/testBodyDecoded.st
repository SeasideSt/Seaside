tests
testBodyDecoded
	| request headers |
	request := WARequest method: 'POST' uri: '/foo?bar=1'.
	request setBody: ((GRCodec forEncoding: 'utf-8') encode: 'baz=2&bar=3&foo=é').
	self should: [ request bodyDecoded ] raise: WAIllegalStateException.
	
	headers := Dictionary new.
	headers at: 'content-type' put: (WAMimeType formUrlencoded charset: 'utf-8'; yourself) greaseString.
	request setHeaders: headers.

	self assert: request bodyDecoded equals: 'baz=2&bar=3&foo=é'.
	
	request setBody: nil.
	self assert: request bodyDecoded equals: nil