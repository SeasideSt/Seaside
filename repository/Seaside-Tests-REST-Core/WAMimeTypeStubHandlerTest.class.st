Class {
	#name : #WAMimeTypeStubHandlerTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #private }
WAMimeTypeStubHandlerTest >> assertContentType: aMimeTypeStringOrNil accept: anAcceptStringOrNil produces: aProducedMimeTypeStringOrNil [
	| routes headers request context result |
	routes := WAByMethodRoutes routes: (GRPlatform current createRoutesFor: WAMimeTypeStubHandler).
	headers := GRSmallDictionary2 new.
	aMimeTypeStringOrNil isNil ifFalse: [
		headers at: 'content-type' put: aMimeTypeStringOrNil ].
	anAcceptStringOrNil isNil ifFalse: [
		headers at: 'accept' put: anAcceptStringOrNil ].
	request := (WARequest method: 'GET' uri: 'index')
		setHeaders: headers;
		yourself.
	context := WARequestContext request: request response: WAResponse new.
	result := routes routeForContext: context consume: true ifAbsent: [ self assert: false ].
	self assert: result seasideMimeType = (aProducedMimeTypeStringOrNil isNil
		ifTrue: [ nil ]
		ifFalse: [  WAMimeType fromString: aProducedMimeTypeStringOrNil ])
]

{ #category : #private }
WAMimeTypeStubHandlerTest >> assertContentType: aMimeTypeStringOrNil accept: anAcceptStringOrNil routesTo: aSymbol [
	| routes headers request context result |
	routes := WAByMethodRoutes routes: (GRPlatform current createRoutesFor: WAMimeTypeStubHandler).
	headers := GRSmallDictionary2 new.
	aMimeTypeStringOrNil isNil ifFalse: [
		headers at: 'content-type' put: aMimeTypeStringOrNil ].
	anAcceptStringOrNil isNil ifFalse: [
		headers at: 'accept' put: anAcceptStringOrNil ].
	request := (WARequest method: 'GET' uri: 'index')
		setHeaders: headers;
		yourself.
	context := WARequestContext request: request response: WAResponse new.
	result := routes routeForContext: context consume: true ifAbsent: [ self assert: false ].
	self assert: result route selector = aSymbol
]

{ #category : #tests }
WAMimeTypeStubHandlerTest >> testMultipleConentTypeRouting [
	self assertContentType: 'foo/bar' accept: nil routesTo: #processTwo.
	self assertContentType: 'zork/fnord' accept: nil routesTo: #processTwo
]

{ #category : #tests }
WAMimeTypeStubHandlerTest >> testProduceMimeType [
	self assertContentType: nil accept: 'image/jpeg' produces: 'image/jpeg'.
	self assertContentType: nil accept: 'image/png' produces: 'image/png'
]

{ #category : #tests }
WAMimeTypeStubHandlerTest >> testProduceNoMimeType [
	self assertContentType: 'application/xml' accept: nil produces: nil
]

{ #category : #tests }
WAMimeTypeStubHandlerTest >> testSimpleAcceptRouting [
	self assertContentType: nil accept: 'image/jpeg;q=0.8,image/png' routesTo: #producePng.
	self assertContentType: nil accept: 'image/jpeg;q=0.8,image/png;q=0.9' routesTo: #producePng.
	self assertContentType: nil accept: 'image/png,image/jpeg;q=0.8' routesTo: #producePng.
	self assertContentType: nil accept: 'image/png;q=0.9,image/jpeg;q=0.8' routesTo: #producePng.
	
	self assertContentType: '1/1' accept: 'image/png' routesTo: #producePng.
	self assertContentType: '1/1' accept: 'image/png' routesTo: #producePng
]

{ #category : #tests }
WAMimeTypeStubHandlerTest >> testSimpleConentTypeRouting [
	self assertContentType: 'application/xml' accept: nil routesTo: #processApplicationXml.
	self assertContentType: 'text/xml' accept: nil routesTo: #processXml
]
