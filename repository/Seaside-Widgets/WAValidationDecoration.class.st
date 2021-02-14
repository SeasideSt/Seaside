"
A WAValidationDecoration validates its component form data when the component returns using ""answer"" or ""answer:"". A WAValidationDecoration can be added to component via the method ""validateWith:"" as below.

	SampleLoginComponent>>intialize
		form := WAFormDecoration new buttons: self buttons.
		self addDecoration: form.
		self validateWith: [:answerArgOrSelf | answerArgOrSelf validate].
		self addMessage: 'Please enter the following information'.

If component returns via ""answer:"" the answer: argument is passed to the validate block. If the component returns using ""answer"" the sender of ""answer"" is passed to the validate block.

Instance Variables
	exceptionClass:		<Notification>
	message:		<String>
	validationBlock:		<one arg block>

exceptionClass
	- Type of notication that is raised by validation code when validation fails. Default value is WAValidationNotification

message
	- String message displayed on validation failure. Obtained from the notification

validationBlock
	- One arg block, 

"
Class {
	#name : #WAValidationDecoration,
	#superclass : #WAWidgetDecoration,
	#instVars : [
		'message',
		'validationBlock',
		'exceptionClass'
	],
	#category : 'Seaside-Widgets-Decorations'
}

{ #category : #accessing }
WAValidationDecoration >> exceptionClass [
	^ exceptionClass ifNil: [ exceptionClass := WAValidationNotification ]
]

{ #category : #accessing }
WAValidationDecoration >> exceptionClass: aClass [
	exceptionClass := aClass
]

{ #category : #delegation }
WAValidationDecoration >> handleAnswer: anObject [
	^ (super handleAnswer: anObject) or: [ (self validate: anObject) not ]
]

{ #category : #processing }
WAValidationDecoration >> handleAnswer: anObject continueWith: aBlock [
	(self validate: anObject)
		ifTrue: [ aBlock value ]
]

{ #category : #initialization }
WAValidationDecoration >> initialize [
	super initialize.
	message := WAValueHolder new
]

{ #category : #rendering }
WAValidationDecoration >> renderContentOn: html [
	message contents isNil ifFalse: [
		html div
			class: 'validation-error';
			with: message contents ].
	self renderNextOn: html
]

{ #category : #hooks }
WAValidationDecoration >> states [
	^ Array with: message
]

{ #category : #'request processing' }
WAValidationDecoration >> validate: anObject [
	^ [ validationBlock value: anObject.
	message contents: nil.
	true ]
		on: self exceptionClass
		do: [ :exception |
			message contents: exception messageText.
			exception return: false ]
]

{ #category : #convenience }
WAValidationDecoration >> validateWith: aBlock [
	validationBlock := aBlock
]
