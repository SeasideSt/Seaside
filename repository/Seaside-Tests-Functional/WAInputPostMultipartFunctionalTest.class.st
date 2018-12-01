Class {
	#name : #WAInputPostMultipartFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'inputElements',
		'hasBody',
		'ran'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WAInputPostMultipartFunctionalTest >> children [
	^ Array with: inputElements
]

{ #category : #initialization }
WAInputPostMultipartFunctionalTest >> initialize [
	super initialize.
	inputElements := WAInputElementContainer new.
	ran := false
]

{ #category : #actions }
WAInputPostMultipartFunctionalTest >> readRequestBody [
	ran := true.
	hasBody := self requestContext request rawBody notNil
]

{ #category : #rendering }
WAInputPostMultipartFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	html form
		multipart;
		with: [
			html table: inputElements.
			html div: [
				self renderRequestBodyOn: html.
				"div for validation"
				html submitButton ] ]
]

{ #category : #rendering }
WAInputPostMultipartFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This form uses a multipart POST request. The upload is supposed to accept a file.'
]

{ #category : #rendering }
WAInputPostMultipartFunctionalTest >> renderRequestBodyOn: html [
	html hiddenInput
		callback: [ self readRequestBody ].
	html strong: 'Request Body:'.
	ran
		ifTrue: [ html text: (hasBody ifTrue: [ 'Success' ] ifFalse: [ 'Fail' ]) ]
		ifFalse: [ html text: 'Not Run' ].
	html break
]
