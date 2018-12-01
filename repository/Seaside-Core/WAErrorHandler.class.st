"
WAErrorHandler catches Errors and Warnings and provides two methods for handling each type of exception:

handleError:
handleWarning:

If either method is not implemented, the default implementation will call #handleDefault:, which can be used to provide common behaviour for both exception types.
"
Class {
	#name : #WAErrorHandler,
	#superclass : #WAExceptionHandler,
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #'exception handling' }
WAErrorHandler class >> exceptionSelector [
	^ super exceptionSelector, Error, Warning
]

{ #category : #actions }
WAErrorHandler >> handleDefault: anException [
	"This method provides the default behaviour if subclasses do
	not implement one of the specific handler methods."
	^ self internalError: anException
]

{ #category : #actions }
WAErrorHandler >> handleError: anError [
	^ self handleDefault: anError
]

{ #category : #actions }
WAErrorHandler >> handleException: anException [
	(Error handles: anException)
		ifTrue: [ ^ self handleError: anException ].
	(Warning handles: anException)
		ifTrue: [ ^ self handleWarning: anException ].

	^ super handleException: anException
]

{ #category : #actions }
WAErrorHandler >> handleWarning: aWarning [
	^ self handleDefault: aWarning
]
