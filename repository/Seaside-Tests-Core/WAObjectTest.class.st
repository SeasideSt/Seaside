"
I contain unit tests for WAObject.
"
Class {
	#name : #WAObjectTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-Base'
}

{ #category : #tests }
WAObjectTest >> testError [
	"Make sure #error: signals a subclass of WAError."
	
	self should: [ WAObject new error: 'oh dear' ] raise: WAError.
	self should: [ WAObject error: 'oh dear' ] raise: WAError
]

{ #category : #tests }
WAObjectTest >> testRequestContext [
	| context |
	self should: [ WAObject new requestContext ] raise: WARequestContextNotFound.
	
	context := WARequestContext request: nil response: nil.
	WACurrentRequestContext
		use: context
		during: [ self assert: WAObject new requestContext == context ]
]
