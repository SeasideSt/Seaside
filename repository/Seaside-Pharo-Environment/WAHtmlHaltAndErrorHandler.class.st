"
This exception handler also catches halts, in order to prevent Debugger windows from popping up and blocking server processes in deployed images.

Subclass this to provide a customized response or more advanced handling (e.g. emailing of errors).
"
Class {
	#name : #WAHtmlHaltAndErrorHandler,
	#superclass : #WAHtmlErrorHandler,
	#category : 'Seaside-Pharo-Environment'
}

{ #category : #'exception handling' }
WAHtmlHaltAndErrorHandler class >> exceptionSelector [
	^ super exceptionSelector, Halt
]
