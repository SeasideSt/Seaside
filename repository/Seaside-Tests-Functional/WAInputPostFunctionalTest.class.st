Class {
	#name : #WAInputPostFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'inputElements',
		'hasBody',
		'ran'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WAInputPostFunctionalTest >> children [
	^ Array with: inputElements
]

{ #category : #initialization }
WAInputPostFunctionalTest >> initialize [
	super initialize.
	inputElements := WAInputElementContainer new.
	ran := false
]

{ #category : #actions }
WAInputPostFunctionalTest >> readRequestBody [
	ran := true.
	hasBody := self requestContext request rawBody notNil
]

{ #category : #rendering }
WAInputPostFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	html form: [
		html table: inputElements.
		html div: [
			self renderRequestBodyOn: html.
			"div for validation"
			html submitButton ] ]
]

{ #category : #rendering }
WAInputPostFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This form uses an URL-encoded POST request. The upload is not supposed to work.'
]

{ #category : #rendering }
WAInputPostFunctionalTest >> renderRequestBodyOn: html [
	html hiddenInput
		callback: [ self readRequestBody ].
	html strong: 'Request Body:'.
	ran
		ifTrue: [ html text: (hasBody ifTrue: [ 'Success' ] ifFalse: [ 'Fail' ]) ]
		ifFalse: [ html text: 'Not Run' ].
	html break
]
