Class {
	#name : #WAExceptionHandlerTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #testing }
WAExceptionHandlerTest >> assertHandles: anObject [
	self assertHandles: anObject returnsSatisfying: [ :result | result ]
]

{ #category : #testing }
WAExceptionHandlerTest >> assertHandles: anObject returnsSatisfying: aBlock [ 
	| result instanceResult |
	result := self handlerClass handles: anObject.
	instanceResult := self createHandler handles: anObject.
	self assert: result = instanceResult.
	self assert: (aBlock value: result)
]

{ #category : #accessing }
WAExceptionHandlerTest >> createHandler [
	^ self handlerClass context: self createRequestContext
]

{ #category : #accessing }
WAExceptionHandlerTest >> createRequestContext [
	^ WARequestContext request: WARequest new response: WABufferedResponse new
]

{ #category : #accessing }
WAExceptionHandlerTest >> handlerClass [
	"The handler to test in this test case"
	^ WAExceptionHandler
]

{ #category : #testing }
WAExceptionHandlerTest >> testCommaReturnsExceptionSet [
	| set |
	set := self handlerClass, WATestError.
	self assert: (set isKindOf: ExceptionSet).
	self assert: (set handles: WATestError new).
	
	set := self createHandler, WATestError.
	self assert: (set isKindOf: ExceptionSet).
	self assert: (set handles: WATestError new)
]

{ #category : #testing }
WAExceptionHandlerTest >> testHandlerClassValidExceptionSelector [
	"The ANSI standard specifies that an object must implement #handles: and #, in
	order to be used as an 'exception selector' (that is, as the first paramter to #on:do:).
	However, some platforms seem to require other protocol. This test will make sure
	that each platform has implemented what is required to make this work."
	
	[ [ self unhandledExceptionClass signal ]
		on: self handlerClass
		do: [ :exception | self assert: false ] ]
			on: Exception
			do: [ :exception | ^ self "test passed" ].
		
	self assert: false "The method should have returned already"
]

{ #category : #testing }
WAExceptionHandlerTest >> testHandlerInstanceValidExceptionSelector [
	"The ANSI standard specifies that an object must implement #handles: and #, in
	order to be used as an 'exception selector' (that is, as the first paramter to #on:do:).
	However, some platforms seem to require other protocol. This test will make sure
	that each platform has implemented what is required to make this work."
	
	[ [ self unhandledExceptionClass signal ]
		on: self createHandler
		do: [ :exception | self assert: false ] ]
			on: Exception
			do: [ :exception | ^ self "test passed" ].
		
	self assert: false "The method should have returned already"
]

{ #category : #testing }
WAExceptionHandlerTest >> testHandlesReturnsBool [
	self 
		assertHandles: WATestError new
		returnsSatisfying: [ :result | #(true false) includes: result ]
]

{ #category : #testing }
WAExceptionHandlerTest >> testInternalError [
	| context |
	context := self createRequestContext.
	[ self handlerClass
			internalError: (WATestError new)
			context: context ]
		on: WAResponseNotification
		do: [ :n |
			self assert: (context response isKindOf: WAResponse).
			self assert: context response status = 500.
			^ self ].
		
	self assert: false
]

{ #category : #testing }
WAExceptionHandlerTest >> testInternalErrorWithMessage [
	| context |
	context := self createRequestContext.
	[ self handlerClass
			internalError: (WATestError new messageText: 'test'; yourself)
			context: context ]
		on: WAResponseNotification
		do: [ :n |
			self assert: (context response isKindOf: WAResponse).
			self assert: context response status = 500.
			^ self ].
		
	self assert: false
]

{ #category : #testing }
WAExceptionHandlerTest >> testUnhandledException [
	[ self handlerClass
		handleExceptionsDuring: [ self unhandledExceptionClass signal ]
		context: self requestContext ]
			on: self unhandledExceptionClass
			do: [ :exception | "success" ^ self ].
	
	self assert: false
	
]

{ #category : #accessing }
WAExceptionHandlerTest >> unhandledExceptionClass [
	"An exception that is not handled by #handlerClass"
	^ Exception
]
