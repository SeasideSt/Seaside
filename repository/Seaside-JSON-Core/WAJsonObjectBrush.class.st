"
A brush to generate a JSON object
"
Class {
	#name : 'WAJsonObjectBrush',
	#superclass : 'WAJsonBrush',
	#category : 'Seaside-JSON-Core-Brushes',
	#package : 'Seaside-JSON-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
WAJsonObjectBrush >> closeBrush [
	self document closeObject
]

{ #category : 'private' }
WAJsonObjectBrush >> openBrush [
	canvas writeIfNotFirst: ', '.
	self document openObject
]
