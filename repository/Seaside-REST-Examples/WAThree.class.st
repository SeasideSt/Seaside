"
I am a component that needs a session.
"
Class {
	#name : #WAThree,
	#superclass : #WAComponent,
	#instVars : [
		'counter'
	],
	#category : 'Seaside-REST-Examples'
}

{ #category : #hooks }
WAThree >> children [
	^ Array with: counter
]

{ #category : #initialization }
WAThree >> initialize [
	super initialize.
	counter := WACounter new
]

{ #category : #rendering }
WAThree >> renderContentOn: html [
	html heading: 'Three'.
	html render: counter
]

{ #category : #hooks }
WAThree >> updateUrl: anUrl [
	super updateUrl: anUrl.
	anUrl addToPath: 'three'
]
