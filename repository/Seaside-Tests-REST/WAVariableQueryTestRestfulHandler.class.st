"
I'm a RestfulHandler used in TestCases
"
Class {
	#name : #WAVariableQueryTestRestfulHandler,
	#superclass : #WARestfulHandler,
	#category : 'Seaside-Tests-REST'
}

{ #category : #'as yet unclassified' }
WAVariableQueryTestRestfulHandler >> fixedRouteWithVariableQuery [
	<path: 'fixedRouteWithVariableQuery?from={from}&to={to}&limit={limit}'>
	<variableQuery: true>
	| request |
	request := self requestContext request.
	self requestContext
		respond: [ :response | 
			request url queryFields
				keysAndValuesDo: [ :key :value | 
					response
						nextPutAll: key;
						nextPut: $=;
						nextPutAll: value;
						nextPut: $& ] ]
]

{ #category : #'as yet unclassified' }
WAVariableQueryTestRestfulHandler >> parameterRouteWithVariableQuery: pathParameter [
	<path: 'parameterRouteWithVariableQuery/{pathParameter}'>
	<variableQuery: true>
	| request |
	request := self requestContext request.
	self requestContext
		respond: [ :response | 
			request url queryFields
				keysAndValuesDo: [ :key :value | 
					response
						nextPutAll: key;
						nextPut: $=;
						nextPutAll: value;
						nextPut: $& ] ]
]

{ #category : #'as yet unclassified' }
WAVariableQueryTestRestfulHandler >> routeWithNoQuery [
	<path: 'routeWithNoQuery'>
	<variableQuery: true>
	self requestContext respond: [ :response |  ]
]
