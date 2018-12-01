"
Use this class as an exceptionHandler when you want to snap off a continuation for all handled exceptions and then display a customizable web page.
"
Class {
	#name : #WAGemStoneProductionErrorHandler,
	#superclass : #WAHtmlHaltAndErrorHandler,
	#classInstVars : [
		'ProductionErrorMessage'
	],
	#category : 'Seaside-GemStone-Environment'
}

{ #category : #initialization }
WAGemStoneProductionErrorHandler class >> initialize [
	WAAdmin applicationExceptionHandlingDefaults at: #exceptionHandler put: self
]

{ #category : #accessing }
WAGemStoneProductionErrorHandler class >> productionErrorMessage [

	ProductionErrorMessage == nil ifTrue: [ ProductionErrorMessage := 'Your request could not be completed. An exception occurred. The system administrator has been informed of this error.' ].
	^ProductionErrorMessage
]

{ #category : #accessing }
WAGemStoneProductionErrorHandler class >> productionErrorMessage: aString [

	ProductionErrorMessage := aString
]

{ #category : #actions }
WAGemStoneProductionErrorHandler >> handleBreakpoint: aBreakpoint [
	"snap off continuation and then resume"
	
	self saveExceptionContinuation: aBreakpoint.
	aBreakpoint resume
]

{ #category : #actions }
WAGemStoneProductionErrorHandler >> handleDefault: anException [

	self saveExceptionContinuation: anException.
	super handleDefault: anException
]

{ #category : #accessing }
WAGemStoneProductionErrorHandler >> productionErrorMessage [

	^self class productionErrorMessage
]

{ #category : #actions }
WAGemStoneProductionErrorHandler >> renderContentForException: anException on: html [
	html heading level1; with: anException description.
	html paragraph: self productionErrorMessage
]
