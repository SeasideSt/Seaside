Class {
	#name : 'JSJavascriptAssignmentBrush',
	#superclass : 'JSJavascriptBrush',
	#category : 'Javascript-Core-Brushes',
	#package : 'Javascript-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
JSJavascriptAssignmentBrush >> closeBrush [
]

{ #category : 'private' }
JSJavascriptAssignmentBrush >> openBrush [
	self document assignment
]
