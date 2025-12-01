Class {
	#name : 'JSJavascriptReturnBrush',
	#superclass : 'JSJavascriptBrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
JSJavascriptReturnBrush >> closeBrush [
]

{ #category : 'private' }
JSJavascriptReturnBrush >> openBrush [
	self document keyword: 'return'
]
