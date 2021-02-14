Class {
	#name : #WAInteractiveGemServerErrorHandler,
	#superclass : #WAErrorHandler,
	#category : 'Seaside-GemStone-GemServer-Core'
}

{ #category : #'exception handling' }
WAInteractiveGemServerErrorHandler class >> exceptionSelector [
	^ super exceptionSelector, GRPlatform current gemstoneExceptionSelector
]

{ #category : #actions }
WAInteractiveGemServerErrorHandler >> handleException: anException [
  anException pass
]
