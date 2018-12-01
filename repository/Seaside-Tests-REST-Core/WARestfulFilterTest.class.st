Class {
	#name : #WARestfulFilterTest,
	#superclass : #WAContextTest,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #running }
WARestfulFilterTest >> setUp [
	super setUp.
	handler := WAStubFilter new
]

{ #category : #tests }
WARestfulFilterTest >> testFindRouteForMethodConsumerIfAbsent [
	| route result requestUrl request context |
	requestUrl := WAUrl new
		addAllToPath: #('users' 'marschall');
		yourself.
	request := WARequest
		method: 'GET'
		uri: requestUrl.
	context := WARequestContext request: request response: WAResponse new.
	result := handler routeForContext: context ifAbsent: [ self assert: false ].
	route := result route.
	self assert: route method = 'GET'.
	self assert: route pathElementCount = 2.
	self assert: route selector = #getDatabase:document:.
	self assert: result elements = #('users' 'marschall').
	self deny: context consumer atEnd
]
