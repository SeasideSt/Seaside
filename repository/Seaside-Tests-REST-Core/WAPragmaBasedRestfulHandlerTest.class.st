Class {
	#name : #WAPragmaBasedRestfulHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #running }
WAPragmaBasedRestfulHandlerTest >> setUp [
	handler := WAPragmaStubHandler new
]

{ #category : #tests }
WAPragmaBasedRestfulHandlerTest >> testCreateRoutes [
	self assert: handler notNil
]
