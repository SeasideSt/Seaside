"
see WAGemStoneProductionErrorHandler
"
Class {
	#name : #WAHtmlHaltAndErrorHandler,
	#superclass : #WAHtmlErrorHandler,
	#category : 'Seaside-GemStone-Environment'
}

{ #category : #'exception handling' }
WAHtmlHaltAndErrorHandler class >> exceptionSelector [
	^ super exceptionSelector, GRPlatform current gemstoneExceptionSelector
]

{ #category : #actions }
WAHtmlHaltAndErrorHandler >> handleException: anException [
	^ self handleGemStoneException: anException
]
