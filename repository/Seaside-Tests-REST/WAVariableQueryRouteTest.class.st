Class {
	#name : #WAVariableQueryRouteTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST'
}

{ #category : #'as yet unclassified' }
WAVariableQueryRouteTest >> handleRequest: aWARequest [
	| handler context |
	handler := WAVariableQueryTestRestfulHandler new yourself.
	context := WARequestContext request: aWARequest response: WABufferedResponse new.
	[ WACurrentRequestContext use: context during: [ handler handleFiltered: context ] ]
		on: WAResponseNotification
		do: [ :ex |  ].
	^ context response
]

{ #category : #'as yet unclassified' }
WAVariableQueryRouteTest >> testFixedRouteWithVariableQuery [
	| handler request fields |
	handler := WAVariableQueryTestRestfulHandler new.
	request := WARequest method: 'GET' uri: 'fixedRouteWithVariableQuery?field1=foo&field2=baz'.
	fields := (WAUrl new parseQuery: (self handleRequest: request) contents) queryFields.
	self assert: fields size equals: 2.
	self assert: (fields at: 'field1') equals: 'foo'.
	self assert: (fields at: 'field2') equals: 'baz'
]

{ #category : #'as yet unclassified' }
WAVariableQueryRouteTest >> testParameterRouteWithVariableQuery [
	| handler request fields |
	handler := WAVariableQueryTestRestfulHandler new.
	request := WARequest method: 'GET' uri: 'parameterRouteWithVariableQuery/pathParameter?field1=foo&field2=baz'.
	fields := (WAUrl new parseQuery: (self handleRequest: request) contents) queryFields.
	self assert: fields size equals: 2.
	self assert: (fields at: 'field1') equals: 'foo'.
	self assert: (fields at: 'field2') equals: 'baz'
]

{ #category : #'as yet unclassified' }
WAVariableQueryRouteTest >> testRouteWithNoQUery [
	| handler request fields |
	handler := WAVariableQueryTestRestfulHandler new.
	request := WARequest method: 'GET' uri: 'routeWithNoQuery'.
	fields := (WAUrl new parseQuery: (self handleRequest: request) contents) queryFields.
	self assert: fields size equals: 0
]
