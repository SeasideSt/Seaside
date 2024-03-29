"
Brush for a JSON array
"
Class {
	#name : 'WAJsonArrayBrush',
	#superclass : 'WAJsonBrush',
	#category : 'Seaside-JSON-Core-Brushes',
	#package : 'Seaside-JSON-Core',
	#tag : 'Brushes'
}

{ #category : 'private' }
WAJsonArrayBrush >> closeBrush [
	self document closeArray
]

{ #category : 'private' }
WAJsonArrayBrush >> openBrush [
	self document openArray
]
