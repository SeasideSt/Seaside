"
Exception handlers are invoked when an error in a Seaside application occurs. Request handlers can use the class-side method #handleExceptionsDuring: to set up exception handlers around a block of code.

== Catching ==

Exception handlers can configure which exceptions they want to catch by overriding the class-side method #exceptionsToCatch. They may also choose to override #handleExceptionsDuring: on the class-side directly, if they need more complex behaviour.

== Handling ==

Handling behaviour is implemented on the instance side by implementing #handleException:. This method should return a suitable seaside response (usually an instance of WAResponse) if it returns.

== Internal Errors ==

Internal errors are typically errors that occur while trying to execute one of the other error handlers and should be as basic as possible to ensure they don't have any trouble executing. Request handlers can ask for an internal error response by calling #internalError: on the class-side of an exception handler.

== HTML Responses ==

See WAWalkbackErrorHandler in the development packages for examples of how to do rendering with the canvas API.

"
Class {
	#name : #WAExceptionHandler,
	#superclass : #WAObject,
	#instVars : [
		'requestContext'
	],
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #'ansi-exception-selector' }
WAExceptionHandler class >> , anException [ 
	"Create an exception set that includes all the exceptions we handle and the
	one passed as a parameter."
	^ self exceptionSelector, anException
]

{ #category : #'instance creation' }
WAExceptionHandler class >> context: aRequestContext [
	^ self basicNew initializeWithContext: aRequestContext; yourself 
]

{ #category : #'exception handling' }
WAExceptionHandler class >> exceptionSelector [
	^ ExceptionSet new
]

{ #category : #'exception handling' }
WAExceptionHandler class >> handleExceptionsDuring: aBlock context: aRequestContext [
	^ (self context: aRequestContext) handleExceptionsDuring: aBlock
]

{ #category : #'ansi-exception-selector' }
WAExceptionHandler class >> handles: anException [ 
	"You should probably override #exceptionSelector instead of this method.
	If you do need to override this method, make sure to override #, as well"
	^ self exceptionSelector handles: anException
]

{ #category : #responding }
WAExceptionHandler class >> internalError: anError context: aRequestContext [
	^ (self context: aRequestContext) internalError: anError
]

{ #category : #'instance creation' }
WAExceptionHandler class >> new [
	^ self context: nil
]

{ #category : #'ansi-exception-selector' }
WAExceptionHandler >> , anException [
	^ self class, anException
]

{ #category : #actions }
WAExceptionHandler >> handleException: anException [
	"If for some reason we are asked to handle an exception for which we have no
	handling behaviour defined, just pass."	
	^ anException pass
]

{ #category : #actions }
WAExceptionHandler >> handleExceptionsDuring: aBlock [
	^ aBlock
		on: self
		do: [ :exception | 
			[ self handleException: exception ]
				"If there's an error while handling the exception, fall
				back on an internal error response."
				on: Error
				do: [ :error | self internalError: error ] ] 
]

{ #category : #'ansi-exception-selector' }
WAExceptionHandler >> handles: anException [
	^ self class handles: anException
]

{ #category : #initialization }
WAExceptionHandler >> initializeWithContext: aRequestContext [
	self initialize.
	requestContext := aRequestContext
]

{ #category : #actions }
WAExceptionHandler >> internalError: anError [ 
	"This method should not call #handleException: because subclasses want to modify the behaviour for for other exceptions without changing the simple fallback internal error behaviour."
	
	self requestContext responseGenerator
		internalError: anError;
		respond
]

{ #category : #accessing }
WAExceptionHandler >> requestContext [
	"Exception handlers are created with a request context because they may
	often be running where WACurrentRequestContext is either undefined or
	unused."
	^ requestContext
]
