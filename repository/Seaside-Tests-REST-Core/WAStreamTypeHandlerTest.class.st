Class {
	#name : #WAStreamTypeHandlerTest,
	#superclass : #WAContextTest,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #private }
WAStreamTypeHandlerTest >> assertPerformGetTo: aCollectionOfStrings equals: aCollection contentType: aMimeType [
	| requestUrl request response context |
	requestUrl := WAUrl new
		addAllToPath: aCollectionOfStrings;
		yourself.
	request := WARequest
		method: 'GET'
		uri: requestUrl.
	response := WABufferedResponse new.
		
	context := WARequestContext request: request response: response.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :n | ].
	
	self assert: response contents = aCollection.
	aMimeType isNil ifFalse: [
		self assert: response contentType = aMimeType.
		self assert: response contentType greaseString = aMimeType greaseString ]
]

{ #category : #running }
WAStreamTypeHandlerTest >> setUp [
	super setUp.
	handler := WAStreamTypeHandler new
]

{ #category : #tests }
WAStreamTypeHandlerTest >> testFaviconIco [
	self assertPerformGetTo: #('favicon.ico') equals: handler faviconIco contentType: nil
]

{ #category : #tests }
WAStreamTypeHandlerTest >> testIndex [
	self assertPerformGetTo: #('index') equals: handler index contentType: nil
]

{ #category : #tests }
WAStreamTypeHandlerTest >> testRobotsTxt [
	self assertPerformGetTo: #('robots.txt') equals: handler robotsTxt contentType: (WAMimeType fromString: 'text/plain;charset=utf-8')
]

{ #category : #tests }
WAStreamTypeHandlerTest >> testStarGif [
	self assertPerformGetTo: #('star.gif') equals: handler starGif contentType: (WAMimeType fromString: 'image/gif')
]
