Class {
	#name : #WAFileHandlerTest,
	#superclass : #WARequestHandlerTest,
	#category : 'Seaside-Tests-Core-Libraries'
}

{ #category : #testing }
WAFileHandlerTest >> assertListing: aResponse [
	self assert: aResponse status = 403.
	self assert: aResponse contentType main = 'text'.
	self assert: aResponse contentType sub = 'plain'
]

{ #category : #testing }
WAFileHandlerTest >> assertNotExisiting: aResponse [
	self assert: aResponse status = 404.
	self assert: aResponse contentType main = 'text'.
	self assert: aResponse contentType sub = 'plain'
]

{ #category : #private }
WAFileHandlerTest >> newHandler [
	^ WAFileHandler new
]

{ #category : #testing }
WAFileHandlerTest >> testHandleDoesNotExist [
	| response |
	self requestContextWithUrl: '/root/files/Cheeseburger/'.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertNotExisiting: response.
	
	self requestContextWithUrl: '/root/files/Cheeseburger'.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertNotExisiting: response.
	
	self requestContextWithUrl: '/root/files/WAStandardFiles/cheeseburger.jpeg'.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertNotExisiting: response
]

{ #category : #testing }
WAFileHandlerTest >> testHandleFileRequest [
	| response |
	self requestContextWithUrl: '/root/files/WATestingFiles/sample.js'.
	self requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: response status = 200.
	self assert: response contentType main = 'application'.
	self assert: response contentType sub = 'x-javascript'.
	self assert: response contents = WATestingFiles new sampleJs
]

{ #category : #testing }
WAFileHandlerTest >> testHandleListing [
	| response |
	self requestContextWithUrl: '/root/files/WATestingFiles/'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response.
	
	self requestContextWithUrl: '/root/files/WATestingFiles'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response.
	
	self requestContextWithUrl: '/root/files/'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response.
	
	self requestContextWithUrl: '/root/files'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response
]

{ #category : #testing }
WAFileHandlerTest >> testResourceBaseUrlConfigured [
	| actualUrl |
	handler preferenceAt: #resourceBaseUrl put: (WAUrl absolute:  '/15/30').
	actualUrl := WATestingFiles default urlOf: #sampleJs using: handler.
	self assert: actualUrl greaseString = '/15/30/WATestingFiles/sample.js'
]

{ #category : #testing }
WAFileHandlerTest >> testResourceBaseUrlNotConfigured [
	| actualUrl |
	handler preferenceAt: #resourceBaseUrl put: nil.
	actualUrl := WATestingFiles default urlOf: #sampleJs using: handler.
	self assert: actualUrl greaseString = ('/', self handlerName, '/WATestingFiles/sample.js')
]
