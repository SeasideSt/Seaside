"
Common superclass for all visitors (visitor pattern)
"
Class {
	#name : 'WAVisitor',
	#superclass : 'WAObject',
	#category : 'Seaside-Core-Utilities',
	#package : 'Seaside-Core',
	#tag : 'Utilities'
}

{ #category : 'testing' }
WAVisitor class >> isAbstract [ 

	^ self == WAVisitor
]

{ #category : 'visiting' }
WAVisitor >> start: anObject [
	self visit: anObject
]

{ #category : 'visiting' }
WAVisitor >> visit: anObject [
	anObject accept: self
]

{ #category : 'visiting' }
WAVisitor >> visitAll: aCollection [
	aCollection do: [ :each | self visit: each ]
]
