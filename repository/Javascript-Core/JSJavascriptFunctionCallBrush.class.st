Class {
	#name : 'JSJavascriptFunctionCallBrush',
	#superclass : 'JSJavascriptBrush',
	#instVars : [
		'name'
	],
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'instance creation' }
JSJavascriptFunctionCallBrush class >> name: aString [
	^ self basicNew initializeWithName: aString
]

{ #category : 'private' }
JSJavascriptFunctionCallBrush >> closeBrush [
	self document nextPut: $)
]

{ #category : 'initialization' }
JSJavascriptFunctionCallBrush >> initializeWithName: aString [
	self initialize.
	name := aString
]

{ #category : 'private' }
JSJavascriptFunctionCallBrush >> openBrush [
	self document identifier: name.
	self document nextPut: $(
]
