"
I am the base class for all tests that need a WARequestContext present.

"
Class {
	#name : #WAContextTest,
	#superclass : #TestCase,
	#instVars : [
		'requestContext'
	],
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #testing }
WAContextTest class >> isAbstract [
	^ self name = #WAContextTest
]

{ #category : #configuration }
WAContextTest >> createCodec [
	^ GRNullCodec new
]

{ #category : #configuration }
WAContextTest >> createHandlers [
	^ #()
]

{ #category : #configuration }
WAContextTest >> createRequest [
	^ WARequest new
]

{ #category : #configuration }
WAContextTest >> createRequestContext [
	^ WARequestContext request: self createRequest response: self createResponse codec: self createCodec
]

{ #category : #configuration }
WAContextTest >> createResponse [
	^ WABufferedResponse new
]

{ #category : #running }
WAContextTest >> performTest [

	requestContext := self createRequestContext.
	WACurrentRequestContext 
		use: self requestContext
		during: [
			self
				pushAll: self createHandlers
				during: [ super performTest ] ]

]

{ #category : #private }
WAContextTest >> pushAll: aCollection during: aBlock [
	^ aCollection isEmpty
		ifTrue: [ aBlock value ]
		ifFalse: [
			self requestContext
				push: aCollection first
				during: [ self pushAll: aCollection allButFirst during: aBlock ] ]
]

{ #category : #accessing }
WAContextTest >> requestContext [
	^ requestContext
]

{ #category : #utilities }
WAContextTest >> requestContextWithUrl: aUrlOrString [
	self requestContextWithUrl: aUrlOrString cookies: Array new
]

{ #category : #utilities }
WAContextTest >> requestContextWithUrl: aUrlOrString cookies: aCollection [
	| handlers |
	handlers := self requestContext handlers.
	self requestContext
		initializeWithRequest: 
			((WARequest method: 'GET' uri: aUrlOrString)
				setCookies: aCollection asArray;
				yourself)
		response: WABufferedResponse new
		codec: self createCodec.
	self requestContext handlers addAll: handlers
]

{ #category : #utilities }
WAContextTest >> responseAfter: aBlock [
	self requestContext response initialize.
	aBlock on: WAResponseNotification do: [ :n | ].
	^ self requestContext response
]
