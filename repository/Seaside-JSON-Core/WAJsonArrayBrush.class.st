Class {
	#name : #WAJsonArrayBrush,
	#superclass : #WAJsonBrush,
	#category : 'Seaside-JSON-Core-Brushes'
}

{ #category : #private }
WAJsonArrayBrush >> closeBrush [
	self document closeArray
]

{ #category : #private }
WAJsonArrayBrush >> openBrush [
	self document openArray
]
