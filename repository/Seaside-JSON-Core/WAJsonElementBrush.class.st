Class {
	#name : #WAJsonElementBrush,
	#superclass : #WAJsonBrush,
	#category : 'Seaside-JSON-Core'
}

{ #category : #private }
WAJsonElementBrush >> closeBrush [
]

{ #category : #private }
WAJsonElementBrush >> openBrush [
	canvas writeIfNotFirst: ', '
]
