Class {
	#name : #WAHomeFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'main'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WAHomeFunctionalTest >> children [
	^ Array with: main
]

{ #category : #initialization }
WAHomeFunctionalTest >> initialize [
	super initialize.
	main := self message: 'Root Component'
]

{ #category : #accessing }
WAHomeFunctionalTest >> message: aString [
	^ WAComponent new
		addMessage: aString;
		yourself
]

{ #category : #rendering }
WAHomeFunctionalTest >> renderContentOn: html [
	html paragraph: 'Clicking home should always bring back the root component.'.
	html paragraph: [
		html anchor
			callback: [ main show: (self message: 'Called Component') ];
			with: 'call'.
		html space.
		html anchor
			callback: [ main home ];
			with: 'home' ].
	html render: main
]
