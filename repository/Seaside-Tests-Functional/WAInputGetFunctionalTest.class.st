Class {
	#name : #WAInputGetFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'inputElements'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WAInputGetFunctionalTest >> children [
	^ Array with: inputElements
]

{ #category : #initialization }
WAInputGetFunctionalTest >> initialize [
	super initialize.
	inputElements := WAInputElementContainer new
]

{ #category : #rendering }
WAInputGetFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	html form
		get;
		with: [
			html table: inputElements.
			html div: [
				"div for validation"
				html submitButton ] ]
]

{ #category : #rendering }
WAInputGetFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This form uses a HTTP GET request. The upload is not supposed to work.'
]
