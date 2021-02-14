Class {
	#name : #WAJsonObjectBrush,
	#superclass : #WAJsonBrush,
	#category : 'Seaside-JSON-Core'
}

{ #category : #private }
WAJsonObjectBrush >> closeBrush [
	self document closeObject
]

{ #category : #private }
WAJsonObjectBrush >> openBrush [
	canvas writeIfNotFirst: ', '.
	self document openObject
]
