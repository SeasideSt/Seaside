"
Brush for a JSON array
"
Class {
	#name : 'JSJavascriptArrayBrush',
	#superclass : 'JSJavascriptBrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
JSJavascriptArrayBrush >> closeBrush [
	self document closeArray
]

{ #category : 'private' }
JSJavascriptArrayBrush >> openBrush [
	self document openArray
]
