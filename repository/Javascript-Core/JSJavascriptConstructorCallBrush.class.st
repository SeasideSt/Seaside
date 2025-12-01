Class {
	#name : 'JSJavascriptConstructorCallBrush',
	#superclass : 'JSJavascriptBrush',
	#instVars : [
		'name'
	],
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'instance creation' }
JSJavascriptConstructorCallBrush class >> name: aString [
	^ self basicNew initializeWithName: aString
]

{ #category : 'private' }
JSJavascriptConstructorCallBrush >> closeBrush [
	self document nextPut: $)
]

{ #category : 'initialization' }
JSJavascriptConstructorCallBrush >> initializeWithName: aString [
	self initialize.
	name := aString
]

{ #category : 'private' }
JSJavascriptConstructorCallBrush >> openBrush [
	self document keyword: 'new'.
	self document identifier: name.
	self document nextPut: $(
]
