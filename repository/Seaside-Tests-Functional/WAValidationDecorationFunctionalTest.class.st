Class {
	#name : #WAValidationDecorationFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAValidationDecorationFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	self renderValidationOn: html
]

{ #category : #rendering }
WAValidationDecorationFunctionalTest >> renderExplanationOn: html [
	html paragraph: [
		html text: 'This is a functional test for WAValidationDecoration.'.
		html orderedList: [
			html listItem: 'Clicking on ''Start'' should take you to a new page with two links, "Fail validation" and "Suceed validation"'.
			html listItem: 'Clicking on "Fail validation" should display "Validation Failed!" above the two links'.
			html listItem: 'Clicking on "Suceed validation" should just display "Validation Suceeded!" and then take you back to this page' ] ]
]

{ #category : #rendering }
WAValidationDecorationFunctionalTest >> renderValidationOn: html [
	html anchor
		callback: [ self startValidation ];
		with: 'Start'
]

{ #category : #actions }
WAValidationDecorationFunctionalTest >> startValidation [
	self call: (WAValidationTestComponent new
		validateWith: [ :value |
			value ifFalse: [
				WAValidationNotification signal: 'Validation Failed!' ] ];
		yourself).
	self inform: 'Validation Suceeded!'
]
