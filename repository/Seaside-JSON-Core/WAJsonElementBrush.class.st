"
Abstract superclass for JSON elements
"
Class {
	#name : 'WAJsonElementBrush',
	#superclass : 'WAJsonBrush',
	#category : 'Seaside-JSON-Core-Brushes',
	#package : 'Seaside-JSON-Core',
	#tag : 'Brushes'
}

{ #category : 'testing' }
WAJsonElementBrush class >> isAbstract [ 

	^ self == WAJsonElementBrush
]

{ #category : 'private' }
WAJsonElementBrush >> closeBrush [
]

{ #category : 'private' }
WAJsonElementBrush >> openBrush [
	canvas writeIfNotFirst: ', '
]
