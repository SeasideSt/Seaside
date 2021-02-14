Class {
	#name : #WAKeyGeneratorFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'key'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAKeyGeneratorFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	key isNil
		ifTrue: [ self renderKeyGeneratorOn: html ]
		ifFalse: [ self renderKeyOn: html ]
]

{ #category : #rendering }
WAKeyGeneratorFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This test should display a dialog for creating a secret key. After submitting the form the public key should be displayed.'.
	html paragraph: 'This test does not work on IE'
]

{ #category : #rendering }
WAKeyGeneratorFunctionalTest >> renderKeyGeneratorOn: html [
	html form: [
		html keyGenerator
			callback: [ :k | key := k ].
		html submitButton ]
]

{ #category : #rendering }
WAKeyGeneratorFunctionalTest >> renderKeyOn: html [
	html render: key
]
