Class {
	#name : 'JSJavascriptOperatorBrush',
	#superclass : 'JSJavascriptBrush',
	#instVars : [
		'operator'
	],
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'instance creation' }
JSJavascriptOperatorBrush class >> operator: aString [
	^ self basicNew initializeWithOperator: aString
]

{ #category : 'private' }
JSJavascriptOperatorBrush >> closeBrush [
]

{ #category : 'initialization' }
JSJavascriptOperatorBrush >> initializeWithOperator: aString [
	self initialize.
	operator := aString
]

{ #category : 'private' }
JSJavascriptOperatorBrush >> openBrush [
	self document operator: operator
]
