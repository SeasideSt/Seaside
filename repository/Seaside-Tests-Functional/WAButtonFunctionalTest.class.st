Class {
	#name : #WAButtonFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'input'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #initialization }
WAButtonFunctionalTest >> initialize [
	super initialize.
	self input: 'a text'
]

{ #category : #accessing }
WAButtonFunctionalTest >> input [
	^ input
]

{ #category : #accessing }
WAButtonFunctionalTest >> input: aString [
	input := aString
]

{ #category : #rendering }
WAButtonFunctionalTest >> renderContentOn: html [
	html form: [
		html div: [
			self renderInputOn: html.
			self renderSubmitOn: html.
			self renderResetOn: html.
			self renderPushOn: html ] ]
]

{ #category : #rendering }
WAButtonFunctionalTest >> renderInputOn: html [
	html table: [
		html tableRow: [
			html tableHeading: 'Value:'.
			html tableData: self input ].
		html tableRow: [
			html tableHeading: 'Input:'.
			html tableData: [
				html textInput
					on: #input of: self ] ] ]
]

{ #category : #rendering }
WAButtonFunctionalTest >> renderPushOn: html [
	html heading level2 with: 'Push'.
	html paragraph: 'Clicking the button should not do anything.'.
	html button bePush; with: 'Push'
]

{ #category : #rendering }
WAButtonFunctionalTest >> renderResetOn: html [
	html heading level2 with: 'Reset'.
	html paragraph: 'Clicking the button should not submit the form and reset the value in "Input"'.
	html button beReset; with: 'Reset'
]

{ #category : #rendering }
WAButtonFunctionalTest >> renderSubmitOn: html [
	html heading level2 with: 'Submit'.
	html paragraph: 'Clicking the button should submit the form and update the value in "Value:" with the value in "Input"'.
	html button with: 'Submit'
]
