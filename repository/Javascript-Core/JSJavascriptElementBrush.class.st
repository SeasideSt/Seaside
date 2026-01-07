"
Abstract superclass for JSON elements
"
Class {
	#name : 'JSJavascriptElementBrush',
	#superclass : 'JSJavascriptBrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'testing' }
JSJavascriptElementBrush class >> isAbstract [ 

	^ self == JSJavascriptElementBrush
]

{ #category : 'private' }
JSJavascriptElementBrush >> closeBrush [
]

{ #category : 'private' }
JSJavascriptElementBrush >> openBrush [
	canvas writeCharacterIfNotFirst: $,
]
