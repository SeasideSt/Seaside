"
WAInputDialog generates a simple form with a text input field and a submit button. The instance variable ""value"" is used for initial value of the text field and hold the text entered by user. WAInputDialog answers with text entered by user (value of ""value""). See WAComponent>>request:label:default: for sample use and easy way to use WAInputDialog.

Instance Variables:
	label	<String>	label of submit button
	value	<Object | String>	

"
Class {
	#name : #WAInputDialog,
	#superclass : #WACanvasWidget,
	#instVars : [
		'label',
		'value'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #accessing }
WAInputDialog >> default: aString [
	value := aString
]

{ #category : #accessing }
WAInputDialog >> label [
	^ label ifNil: [ label := 'OK' ]
]

{ #category : #accessing }
WAInputDialog >> label: aString [
	label := aString
]

{ #category : #rendering }
WAInputDialog >> renderContentOn: html [
	html form
		defaultAction: [ self answer: value ];
		with: [
			html div: [
				html textInput on: #value of: self.
				html space.
				html submitButton
					callback: [ self answer: value ];
					text: self label ] ]
]

{ #category : #accessing }
WAInputDialog >> value [
	^ value
]

{ #category : #accessing }
WAInputDialog >> value: aString [
	value := aString
]
