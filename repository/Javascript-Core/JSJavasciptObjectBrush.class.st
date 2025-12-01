"
A brush to generate a JSON object
"
Class {
	#name : 'JSJavasciptObjectBrush',
	#superclass : 'JSJavascriptBrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
JSJavasciptObjectBrush >> closeBrush [
	self document closeObject
]

{ #category : 'private' }
JSJavasciptObjectBrush >> openBrush [
	self document openObject
]
