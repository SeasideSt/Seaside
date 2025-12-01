"
I am unescaped Javascript code that is rendered verbatim.
"
Class {
	#name : 'JSCode',
	#superclass : 'WAObject',
	#instVars : [
		'code'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
JSCode class >> on: aString [
	^ self basicNew initializeOn: aString
]

{ #category : 'initialization' }
JSCode >> initializeOn: aString [
	self initialize.
	code := aString
]

{ #category : 'printing' }
JSCode >> javascriptOn: aRenderer [
	aRenderer javascript: code
]
