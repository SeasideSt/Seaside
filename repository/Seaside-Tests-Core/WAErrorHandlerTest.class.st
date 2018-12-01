Class {
	#name : #WAErrorHandlerTest,
	#superclass : #WAExceptionHandlerTest,
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #testing }
WAErrorHandlerTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
WAErrorHandlerTest >> handlerClass [
	^ WAErrorHandler
]

{ #category : #tests }
WAErrorHandlerTest >> testError [
	| context |
	context := self createRequestContext.
	[ self handlerClass
		handleExceptionsDuring: [ WAError signal ]
		context: context ]
			on: WAResponseNotification
			do: [ :n | self assert: context response status = 500. ^ self ].
			
	self assert: false
]

{ #category : #tests }
WAErrorHandlerTest >> testHandlesError [
	self assert: (self handlerClass handles: Error new).
	self assert: (self createHandler handles: Error new)
]

{ #category : #tests }
WAErrorHandlerTest >> testHandlesWarning [
	self assert: (self handlerClass handles: Warning new).
	self assert: (self createHandler handles: Warning new)
]

{ #category : #tests }
WAErrorHandlerTest >> testWarning [
	| context |
	context := self createRequestContext.
	[ self handlerClass
		handleExceptionsDuring: [ Warning signal ]
		context: context ]
			on: WAResponseNotification
			do: [ :n | self assert: context response status = 500. ^ self ].
			
	self assert: false
]
