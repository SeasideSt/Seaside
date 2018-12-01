Class {
	#name : #WASwagger2RestfulHandlerTest,
	#superclass : #WARequestHandlerTest,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #testing }
WASwagger2RestfulHandlerTest class >> isAbstract [
	^ self name = #WASwagger2RestfulHandlerTest
]

{ #category : #private }
WASwagger2RestfulHandlerTest >> assert: anObject equals: aString [
	self
		assert: anObject = aString
		description: anObject printString, ' expected to be ', aString printString
		resumable: true
]

{ #category : #private }
WASwagger2RestfulHandlerTest >> expectedConfigurationFile [
	self subclassResponsibility
]

{ #category : #private }
WASwagger2RestfulHandlerTest >> handlerClass [
	self subclassResponsibility
]

{ #category : #private }
WASwagger2RestfulHandlerTest >> handlerName [
	^ 'config-api'
]

{ #category : #private }
WASwagger2RestfulHandlerTest >> newHandler [
	^ self handlerClass new
]

{ #category : #testing }
WASwagger2RestfulHandlerTest >> testSwaggerSpecificationFile [
	| file |
	file := handler getSwaggerSpecificationFile.
	self assert: (WAJsonParser parse: file) equals: (WAJsonParser parse: self expectedConfigurationFile)
]
