"
A brush to generate JSON
"
Class {
	#name : 'WAJsonBrush',
	#superclass : 'WABrush',
	#category : 'Seaside-JSON-Core-Brushes',
	#package : 'Seaside-JSON-Core',
	#tag : 'Brushes'
}

{ #category : 'testing' }
WAJsonBrush class >> isAbstract [ 

	^ self == WAJsonBrush
]

{ #category : 'private' }
WAJsonBrush >> closeBrush [
	self subclassResponsibility
]

{ #category : 'accessing' }
WAJsonBrush >> document [
	^ canvas document
]

{ #category : 'private' }
WAJsonBrush >> openBrush [
	self subclassResponsibility
]

{ #category : 'public' }
WAJsonBrush >> with: anObject [

	self openBrush.
	super with: [
		canvas render: anObject ].
	self closeBrush
]
