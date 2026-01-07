Class {
	#name : 'JSJavascriptFunctionArgumentsBrush',
	#superclass : 'JSJavascriptBrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
JSJavascriptFunctionArgumentsBrush >> closeBrush [
	self document nextPut: $)
]

{ #category : 'private' }
JSJavascriptFunctionArgumentsBrush >> openBrush [
	self document nextPut: $(
]
