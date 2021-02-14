Class {
	#name : #WAResponseTest,
	#superclass : #TestCase,
	#instVars : [
		'response'
	],
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #testing }
WAResponseTest class >> isAbstract [
	^ self name = #WAResponseTest
]

{ #category : #private }
WAResponseTest >> assertLines: anArray [
	self assert: self lines = anArray
]

{ #category : #accessing }
WAResponseTest >> contents [
	"Answer a string of the complete response as it is sent to the client."
	
	self subclassResponsibility
]

{ #category : #accessing }
WAResponseTest >> lines [
	"Answer the response as an array of lines, to be used within the tests."

	| result stream |
	result := OrderedCollection new.
	stream := self contents readStream.
	[ stream atEnd ] whileFalse: [ result add: (stream greaseUpToAll: (String with: Character cr with: Character lf)) ].
	^ result asArray
]

{ #category : #accessing }
WAResponseTest >> response [
	"Answer the response under test."

	^ response
]

{ #category : #'tests-conveniance' }
WAResponseTest >> testAttachmentWithFileName [
	self response attachmentWithFileName: 'foo.txt'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Disposition: attachment; filename="foo.txt"' 'Content-Length: 0' '')
]

{ #category : #'tests-conveniance' }
WAResponseTest >> testBasicAuthentication [
	self response basicAuthenticationRealm: 'seaside'.
	self assertLines: #('HTTP/1.1 401 Unauthorized' 'WWW-Authenticate: Basic realm="seaside"' 'Content-Length: 0' '')
]

{ #category : #'tests-cache' }
WAResponseTest >> testCacheFor [
	self response cacheFor: (Duration days: 1 hours: 0 minutes: 0 seconds: 0).
	self assert: (self response headerAt: 'Pragma') isNil.
	self assert: (self response headerAt: 'Expires') notNil.
	self assert: (self response headerAt: 'Cache-Control') = 'max-age=86400'
]

{ #category : #'tests-cache' }
WAResponseTest >> testCacheForever [
	self response cacheForever.
	self assert: (self response headerAt: 'Pragma') isNil.
	self assert: (self response headerAt: 'Expires') notNil.
	self assert: (self response headerAt: 'Cache-Control') isNil
]

{ #category : #'tests-cache' }
WAResponseTest >> testCacheForeverExpiryDate [
	| expiry delta |
	expiry := self response cacheForeverExpiryDate.
	delta := expiry - DateAndTime now.
	self assert: delta days > 7.
	self assert: delta days < 356
]

{ #category : #'tests-status' }
WAResponseTest >> testCodes [
	| names codes |
	names := #( authenticationFailed forbidden found gone internalError notFound notImplemented ).
	codes := #( 401 403 302 410 500 404 501 ).
	names with: codes do: [ :name :code | 
		self response perform: name.
		self assert: self response status = code.
		self assert: self response message = (self response class messageForStatus: code) ]
]

{ #category : #tests }
WAResponseTest >> testContentType [
	self response contentType: WAMimeType textHtml.
	self assert: self response contentType = WAMimeType textHtml.
	
	self response contentType: WAMimeType imagePng.
	self assert: self response contentType = WAMimeType imagePng
]

{ #category : #'tests-cache' }
WAResponseTest >> testDefaultCache [
	self deny: (self response headers includesKey: 'Pragma').
	self deny: (self response headers includesKey: 'Expires').
	self deny: (self response headers includesKey: 'Cache-Control')
]

{ #category : #'tests-cache' }
WAResponseTest >> testDeleteCookie [
	| cookie actual |
	cookie := (WARequestCookie key: 'key' value: 'value')
		pathUnencoded: '/highway/to/hell' encoded: '/highway/to/hell';
		domain: 'hotel'
		yourself.
	self response deleteCookie: cookie.
	self assert: self response cookies size = 1.
	actual := self response cookies first.
	self assert: cookie ~~ actual.
	self assert: actual domain = 'hotel'.
	self assert: actual path = '/highway/to/hell'
]

{ #category : #'tests-cache' }
WAResponseTest >> testDoNotCache [
	self response doNotCache.
	self assert: (self response headerAt: 'Pragma') = 'no-cache'.
	self assert: (self response headerAt: 'Expires') notNil.
	self assert: (self response headerAt: 'Cache-Control') = 'no-cache, max-age=0, must-revalidate, no-store'
]

{ #category : #'tests-cache' }
WAResponseTest >> testDoNotCacheExpiryDate [
	| expiry delta |
	expiry := self response doNotCacheExpiryDate.
	delta := expiry - DateAndTime now.
	self assert: delta days < -7
]

{ #category : #'tests-documents' }
WAResponseTest >> testDocumentMimeType [
	self response document: 'alert("Seaside")' mimeType: 'text/javascript'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Type: text/javascript' 'Content-Length: 16' '' 'alert("Seaside")')
]

{ #category : #'tests-documents' }
WAResponseTest >> testDocumentMimeTypeFileName [
	self response document: 'foo;bar;zork' mimeType: 'text/csv' fileName: 'table.csv'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Disposition: attachment; filename="table.csv"' 'Content-Type: text/csv' 'Content-Length: 12' '' 'foo;bar;zork')
]

{ #category : #'tests-headers' }
WAResponseTest >> testHeadersAt [
	self assert: (self response headerAt: 'foo') isNil.
	self response headerAt: 'foo' put: 'bar'.
	self assert: (self response headerAt: 'foo') = 'bar'
]

{ #category : #'tests-headers' }
WAResponseTest >> testHeadersAtAppend [
	self assert: (self response headerAt: 'foo' append: 'bar') = 'bar'.
	self assert: (self response headerAt: 'foo') = 'bar'.
	self assert: (self response headerAt: 'foo' append: 'zork') = 'zork'.
	self assert: (self response headerAt: 'foo') = 'bar'.
	self assert: (self response headers size) = 2
]

{ #category : #'tests-headers' }
WAResponseTest >> testHeadersAtIfAbsent [
	self assert: (self response headerAt: 'foo' ifAbsent: [ 'zork' ]) = 'zork'.
	self response headerAt: 'foo' put: 'bar'.
	self assert: (self response headerAt: 'foo' ifAbsent: [ 'zork' ]) = 'bar'
]

{ #category : #'tests-headers' }
WAResponseTest >> testHeadersAtPut [
	self assert: (self response headerAt: 'foo' put: 'bar') = 'bar'.
	self assert: (self response headerAt: 'foo') = 'bar'.
	self assert: (self response headerAt: 'foo' put: 'zork') = 'zork'.
	self assert: (self response headerAt: 'foo') = 'zork'.
	self assert: (self response headers size) = 1
]

{ #category : #'tests-headers' }
WAResponseTest >> testHeadersRemoveAt [
	self response headerAt: 'foo' put: 'bar'.
	self response headerAt: 'bar' put: 'baz'.
	self assert: (self response removeHeaderAt: 'foo') = #('bar').
	self assert: (self response removeHeaderAt: 'bar') = #('baz').
	self assert: (self response headers isEmpty)
]

{ #category : #'tests-conveniance' }
WAResponseTest >> testInlineWithFileName [
	self response inlineWithFileName: 'bar.txt'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Disposition: inline; filename="bar.txt"' 'Content-Length: 0' '')
]

{ #category : #tests }
WAResponseTest >> testIsCommitted [
	self deny: self response isCommitted.
	self response contentType: 'text/html'.

	self deny: self response isCommitted.
	self response nextPutAll: 'Visit <a href="http://www.seaside.st">seaside.st</a>.'.

	self assertLines: #('HTTP/1.1 200 OK' 'Content-Type: text/html' 'Content-Length: 53' '' 'Visit <a href="http://www.seaside.st">seaside.st</a>.')
]

{ #category : #'tests-status' }
WAResponseTest >> testMessage [
	self assert: self response message = 'OK'.
	
	self response status: 404.
	self assert: self response message = 'Not Found'.
	
	self response status: 290.
	self assert: self response message isNil.
	
	self response status: 290 message: 'Seaside Rocks'.
	self assert: self response message = 'Seaside Rocks'
	

]

{ #category : #'tests-conveniance' }
WAResponseTest >> testRedirectTo [
	self response redirectTo: 'http://www.seaside.st/'.
	self assertLines:  #('HTTP/1.1 302 Found' 'Location: http://www.seaside.st/' 'Content-Length: 0' '')
]

{ #category : #'tests-conveniance' }
WAResponseTest >> testRefreshAfterLocation [
	self response refreshAfter: 3 seconds location: 'http://www.seaside.st/'.
	self assertLines: #('HTTP/1.1 200 OK' 'Refresh: 3; http://www.seaside.st/' 'Content-Length: 0' '')
]

{ #category : #'tests-status' }
WAResponseTest >> testStatus [
	self assert: self response status = 200.
	self response status: 404.
	self assert: self response status = 404
]

{ #category : #tests }
WAResponseTest >> testStreaming [
	| stream |
	self response notFound.
	
	" This is a normal write stream that supports the standard WriteStream protocol. All Smalltalk dialects should support common messages such as #nextPut:, #nextPutAll:, #print:, #crlf, etc."
	stream := self response stream.
	stream nextPutAll: 'A long long way from home.'.
	stream crlf.
	stream nextPut: $!.
	stream print: 123.
	
	self assertLines: #('HTTP/1.1 404 Not Found' 'Content-Length: 32' '' 'A long long way from home.' '!123')
]

{ #category : #'tests-conveniance' }
WAResponseTest >> testStrictTransportSecurity [
	self response strictTransportSecurity: 500 includeSubDomains: true.
	self assert: (self response headerAt: 'Strict-Transport-Security') = 'max-age=500; includeSubDomains'.
	
	self response strictTransportSecurity: 500 includeSubDomains: false.
	self assert: (self response headerAt: 'Strict-Transport-Security') = 'max-age=500'
]
