Class {
	#name : #WAWelcomeAuthorNamePrompter,
	#superclass : #WAComponent,
	#instVars : [
		'authorName'
	],
	#category : 'Seaside-Welcome'
}

{ #category : #accessing }
WAWelcomeAuthorNamePrompter >> authorName [
	^ authorName ifNil: [ authorName := 'FirstnameLastname' ]
]

{ #category : #accessing }
WAWelcomeAuthorNamePrompter >> authorName: anAuthorName [
	authorName := anAuthorName 
]

{ #category : #private }
WAWelcomeAuthorNamePrompter >> handleAuthorNameSubmission [
	"AuthorName appears to prefer no accented characters so a simple select block with 'char isLetter' is not sufficent"
	self authorName: (self authorName select: [ :char |
		'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' includes: char ]).
	
	self authorName ifEmpty: [ self authorName: nil. ^ self ].
	
	GRPlatform current seasideSetAuthorName: self authorName.
	self answer
]

{ #category : #rendering }
WAWelcomeAuthorNamePrompter >> renderContentOn: html [
	html form: [
		html text: 'You are about to create your first component in this Smalltalk image, please enter your name to associate it with your code:'.
		html textInput
			on: #authorName of: self.
		html submitButton
			text: 'OK';
			callback: [ self handleAuthorNameSubmission ] ]
]
