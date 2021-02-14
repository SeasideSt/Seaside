Class {
	#name : #SUFunctionalTest,
	#superclass : #WAComponent,
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #accessing }
SUFunctionalTest >> coreClass [
	"Answer the actual implementation of the feature."
	
	^ nil
]

{ #category : #rendering }
SUFunctionalTest >> renderBox: aString on: html [
	html div id: aString; class: 'box'; with: [
		html div class: 'header'.
		html div
			class: 'content';
			with: 'Smalltalk Enterprise Aubergines' ]
]

{ #category : #testing }
SUFunctionalTest >> testClass [
	"Answer the class that represents this example."
	
	^ self class
]
