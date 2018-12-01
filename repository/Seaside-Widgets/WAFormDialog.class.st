"
WAFormDialog is an empty html form. Used in WAComponent>>inform: to create a dialog component that displays text and an ""Ok"" button to close the component. See subclasses for sample usage & more functionality.

Instance Variables:
	form	<WAFormDecoration> Decorator that generates form tags
	validationError	<String>	Text descriping invalid data entered by user. Displayed when not nil. Set to nil when user submits form.

"
Class {
	#name : #WAFormDialog,
	#superclass : #WACanvasWidget,
	#instVars : [
		'validationError',
		'form'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #actions }
WAFormDialog >> addForm [
	form := WAFormDecoration new buttons: self buttons.
	self addDecoration: form
]

{ #category : #testing }
WAFormDialog >> addFormByDefault [
	^ true
]

{ #category : #accessing }
WAFormDialog >> buttons [
	^ #(ok)
]

{ #category : #accessing }
WAFormDialog >> defaultButton [
	^ self buttons first
]

{ #category : #accessing }
WAFormDialog >> divClass [
	^ self class name
]

{ #category : #initialization }
WAFormDialog >> initialize [
	super initialize.
	self addFormByDefault
		ifTrue: [ self addForm ]
]

{ #category : #testing }
WAFormDialog >> isValid [
	^ validationError isNil
]

{ #category : #accessing }
WAFormDialog >> model [
	^ self
]

{ #category : #actions }
WAFormDialog >> ok [
	self answer
]

{ #category : #actions }
WAFormDialog >> removeForm [
	form isNil
		ifFalse: [ self removeDecoration: form ]
]

{ #category : #rendering }
WAFormDialog >> renderContentOn: html [
	html hiddenInput 
		callback: [ validationError := nil ].
	validationError isNil
		ifFalse: [ self renderValidationError: validationError on: html ].
	html div
		class: self divClass;
		with: [ self renderDialogOn: html ]
]

{ #category : #rendering }
WAFormDialog >> renderDialogOn: html [
]

{ #category : #rendering }
WAFormDialog >> renderSpacerRowOn: html [
	html div class: 'dialog-spacer'; with: [ html space ]
]

{ #category : #rendering }
WAFormDialog >> renderValidationError: aString on: html [
	html span class: 'dialog-validation'; with: aString
]

{ #category : #validation }
WAFormDialog >> validationError: aString [
	validationError := aString
]
