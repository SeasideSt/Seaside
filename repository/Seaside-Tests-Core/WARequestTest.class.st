Class {
	#name : #WARequestTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #tests }
WARequestTest >> test10 [
	| request |
	request := WARequest method: 'GET' uri: '/' version: WAHttpVersion http10.
	
	self assert: request isGet.
	self assert: request isHttp10.
	self deny: request isSsl
]

{ #category : #tests }
WARequestTest >> test11 [
	| request |
	request := WARequest method: 'GET' uri: '/' version: WAHttpVersion http11.
	
	self assert: request isGet.
	self assert: request isHttp11.
	self deny: request isSsl
]

{ #category : #tests }
WARequestTest >> testBasicAuthorisation [
	| request headers |
	request := WARequest method: 'GET' uri: '/foo?bar=1'.
	headers := Dictionary new.
	headers at: 'authorization' put: 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='.
	request setHeaders: headers.
	
	self assert: request authorization = 'Aladdin:open sesame'.
	self assert: request user = 'Aladdin'.
	self assert: request password = 'open sesame'
]

{ #category : #tests }
WARequestTest >> testIsPrefetch [
	| request headers |
	request := WARequest method: 'GET' uri: '/foo'.
	self deny: request isPrefetch.
	
	headers := Dictionary new.
	headers at: 'x-moz' put: 'prefetch'.
	request setHeaders: headers.
	self assert: request isPrefetch
]

{ #category : #tests }
WARequestTest >> testIsSsl [
	| request |
	request := WARequest
		method: 'GET'
		uri: ('/' seasideUrl
			scheme: 'https';
			yourself)
		version: WAHttpVersion http11.
	
	self assert: request isGet.
	self assert: request isHttp11.
	self assert: request isSsl
]

{ #category : #tests }
WARequestTest >> testPostFields [
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
]
