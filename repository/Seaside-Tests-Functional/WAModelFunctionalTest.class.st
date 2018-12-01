Class {
	#name : #WAModelFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'state',
		'user',
		'pass',
		'test'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #actions }
WAModelFunctionalTest >> logoff [
	state := #OFF.
	test ifTrue: [ self inform: 'Logged off' onAnswer: [ ] ]
]

{ #category : #actions }
WAModelFunctionalTest >> logon [
	user isEmptyOrNil
		ifTrue:
			[ self inform: 'Nope !' onAnswer: [ ] ]
		ifFalse:
			[ state := #ON.
			test ifTrue: [ self inform: 'Logged on' onAnswer: [ ] ] ]
]

{ #category : #accessing }
WAModelFunctionalTest >> pass [
	"Answer the value of pass"

	^ pass
]

{ #category : #accessing }
WAModelFunctionalTest >> pass: anObject [
	"Set the value of pass"

	pass := anObject
]

{ #category : #rendering }
WAModelFunctionalTest >> renderButtonOn: html [
	| action |
	action := state == #ON ifTrue: [ #logoff ] ifFalse: [ #logon ].
	html div: [
		"div for validation"
		html submitButton
			on: action of: self ]
]

{ #category : #rendering }
WAModelFunctionalTest >> renderContentOn: html [
	html form
		id: 'myform';
		with: [
			html table: [
				self renderUsernameOn: html.
				self renderPasswordOn: html.
				self renderFeedbackOn: html ].
			html div: [
				self renderButtonOn: html ] ]
]

{ #category : #rendering }
WAModelFunctionalTest >> renderFeedbackOn: html [
	html tableRow: [
		html tableData: [
			html label
				for: #withFeedback;
				with: 'With Feedback:' ].
		html tableData: [
			html checkbox
				id: #withFeedback;
				on: #test of: self ] ]
]

{ #category : #rendering }
WAModelFunctionalTest >> renderPasswordOn: html [
	html tableRow: [
		html tableData: [
			html label
				for: #pass;
				with: 'Password:' ].
		html tableData: [
			html passwordInput
				id: #pass;
				on: #pass of: self ] ]
]

{ #category : #rendering }
WAModelFunctionalTest >> renderUsernameOn: html [
	html tableRow: [
		html tableData: [
			html label
				for: #userid;
				with: 'Username:' ].
		html tableData: [
			html textInput
				id: #userid;
				on: #user of: self ] ]
]

{ #category : #accessing }
WAModelFunctionalTest >> test [
	"Answer the value of test"

	^ test
]

{ #category : #accessing }
WAModelFunctionalTest >> test: anObject [
	"Set the value of test"

	test := anObject
]

{ #category : #accessing }
WAModelFunctionalTest >> user [
	"Answer the value of user"

	^ user
]

{ #category : #accessing }
WAModelFunctionalTest >> user: anObject [
	"Set the value of user"

	user := anObject
]
