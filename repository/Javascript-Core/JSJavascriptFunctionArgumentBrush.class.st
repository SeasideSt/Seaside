Class {
	#name : 'JSJavascriptFunctionArgumentBrush',
	#superclass : 'JSJavascriptBrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
JSJavascriptFunctionArgumentBrush >> closeBrush [
]

{ #category : 'private' }
JSJavascriptFunctionArgumentBrush >> openBrush [
	canvas writeCharacterIfNotFirst: $,
]
