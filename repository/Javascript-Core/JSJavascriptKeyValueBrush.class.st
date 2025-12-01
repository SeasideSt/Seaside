"
A JSON key value
"
Class {
	#name : 'JSJavascriptKeyValueBrush',
	#superclass : 'JSJavascriptElementBrush',
	#instVars : [
		'key'
	],
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'instance creation' }
JSJavascriptKeyValueBrush class >> key: aString [
	^ self basicNew initializeWithKey: aString
]

{ #category : 'initialization' }
JSJavascriptKeyValueBrush >> initializeWithKey: aString [
	self initialize.
	key := aString
]

{ #category : 'private' }
JSJavascriptKeyValueBrush >> openBrush [
	super openBrush.
	key javascriptOn: canvas.
	self document nextPut: $:
]
