Class {
	#name : #WAJsonElementBrush,
	#superclass : #WAJsonBrush,
	#category : 'Seaside-JSON-Core-Brushes'
}

{ #category : #private }
WAJsonElementBrush >> closeBrush [
]

{ #category : #private }
WAJsonElementBrush >> openBrush [
	canvas writeIfNotFirst: ', '
]
