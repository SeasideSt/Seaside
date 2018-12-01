Class {
	#name : #WAResponseGeneratorTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #private }
WAResponseGeneratorTest >> assertContents: aString [
	self assert: self requestContext response contents = aString
]

{ #category : #tests }
WAResponseGeneratorTest >> testForbidden [
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator forbidden.
	self assertContents: 'Error: you are forbidden to access "/"'
]

{ #category : #tests }
WAResponseGeneratorTest >> testInternalError [
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	[ WATestError signal ]
		on: WATestError
		do: [ :error |
			generator internalError: error ].
	self assertContents: 'Internal Error: '
]

{ #category : #tests }
WAResponseGeneratorTest >> testNotFound [
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator notFound.
	self assertContents: '/ not found'
]

{ #category : #tests }
WAResponseGeneratorTest >> testNotImplemented [
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator notImplemented.
	self assertContents:  'Not Implemented'
]

{ #category : #tests }
WAResponseGeneratorTest >> testPageExpired [
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator pageExpired.
	self assertContents: 'This page has expired, please use the back-button to navigate to the last valid page.'
]
