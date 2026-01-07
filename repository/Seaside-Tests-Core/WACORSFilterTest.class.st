Class {
	#name : 'WACORSFilterTest',
	#superclass : 'WAContextTest',
	#instVars : [
		'application'
	],
	#category : 'Seaside-Tests-Core-Filter',
	#package : 'Seaside-Tests-Core',
	#tag : 'Filter'
}

{ #category : 'configuration' }
WACORSFilterTest >> createHandlers [

	| dispatcher root |
	root := WADispatcher new.
	dispatcher := root register: WADispatcher new at: 'root'.
	application := dispatcher register: WAApplication new at: 'corsfiltertest'.
	^ Array with: root with: dispatcher with: application
]

{ #category : 'configuration' }
WACORSFilterTest >> createRequest [
	| request headers |
	request := WARequest new.
	headers := Dictionary new.
	headers at: 'origin' put: 'http://localhost:8080'.
	request setHeaders: headers.
	^ request
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestAllowCredentials [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter allowsCredentials: true.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Credentials') equals: 'true'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestAllowCredentials2 [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter allowsCredentials: false.
	response := self responseAfter: [ application handle: request ].
	self assert: response headers isEmpty
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestAllowedHeaders [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter addAllowedHeader: 'Content-Type'.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Headers') equals: 'Content-Type'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestAllowedHeaders2 [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter 
		addAllowedHeader: 'Content-Type';
		addAllowedHeader: 'X-Custom-Header'.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Headers') equals: 'Content-Type, X-Custom-Header'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestAllowedHeaders3 [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter 
		addAllowedHeader: 'Content-Type';
		allowAllHeaders.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Headers') equals: '*'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestAllowedMethods [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter useExplicitMethods.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Methods') equals: 'GET, POST, HEAD'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestAllowedMethods2 [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter addAllowedMethod: 'GET'.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Methods') equals: 'GET'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestEmpty [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	response := self responseAfter: [ application handle: request ].
	self assert: response headers isEmpty.	

]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestExposedHeaders [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter exposedHeaders: { 'Content-Type' . 'X-Custom-Header' }.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Expose-Headers') equals: 'Content-Type, X-Custom-Header'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestMaxAge [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter maxAge: 3600.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Max-Age') equals: '3600'
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestOriginsHeader [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter allowAnyOrigin.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Origin') equals: '*'.
	self assert: (response headers at: 'Vary') equals: nil.
	self assert: filter allowsAnyOrigin
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestOriginsHeader2 [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter allowedOrigin: 'http://localhost:8080'.
	response := self responseAfter: [ application handle: request ].
	self assert: (response headers at: 'Access-Control-Allow-Origin') equals: 'http://localhost:8080'.
	self assert: (response headers at: 'Vary') equals: 'Origin'.
	self deny: filter allowsAnyOrigin
]

{ #category : 'tests' }
WACORSFilterTest >> testCORSRequestOriginsHeader3 [

	| response request filter |
	request := self requestContext.
	filter := WACORSFilter new.
	application addFilterFirst: filter.
	filter denyAllOrigins.
	response := self responseAfter: [ application handle: request ].
	self assert: response headers isEmpty.
	self deny: filter allowsAnyOrigin
]
