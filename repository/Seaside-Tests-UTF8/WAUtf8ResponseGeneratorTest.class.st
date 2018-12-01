Class {
	#name : #WAUtf8ResponseGeneratorTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-UTF8'
}

{ #category : #private }
WAUtf8ResponseGeneratorTest >> assertContents: aString [
	self assert: self requestContext response contents = aString
]

{ #category : #configuration }
WAUtf8ResponseGeneratorTest >> createRequest [
 	| request |
	request := super createRequest.
	request url
		addToPath: 'book';
		addToPath: (String with: (Character codePoint: 225) with: (Character codePoint: 269)).
	^ request
]

{ #category : #tests }
WAUtf8ResponseGeneratorTest >> testForbidden [
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator forbidden.
	self assertContents: 'Error: you are forbidden to access "/book/', (String with: (Character codePoint: 225) with: (Character codePoint: 269)), '"'
]

{ #category : #tests }
WAUtf8ResponseGeneratorTest >> testNotFound [
	| generator |
	generator := WAResponseGenerator on: self requestContext.
	self requestContext response nextPutAll: 'oops'.
	generator notFound.
	self assertContents: '/book/', (String with: (Character codePoint: 225) with: (Character codePoint: 269)), ' not found'
]
