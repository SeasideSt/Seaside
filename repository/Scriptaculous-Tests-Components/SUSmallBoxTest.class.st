Class {
	#name : #SUSmallBoxTest,
	#superclass : #WAComponent,
	#instVars : [
		'text'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #accessing }
SUSmallBoxTest >> coreClass [
	"Answer the actual implementation of the feature."
	
	^ nil
]

{ #category : #rendering }
SUSmallBoxTest >> renderContentOn: html [
	html div class: 'smallBox'; with: [
		html div class: 'header'.
		html div 
			class: 'content';
			with: text ]
]

{ #category : #testing }
SUSmallBoxTest >> testClass [
	"Answer the class that represents this example."
	
	^ self class
]

{ #category : #accessing }
SUSmallBoxTest >> text [
	^ text
]

{ #category : #accessing }
SUSmallBoxTest >> text: anObject [
	text := anObject
]
